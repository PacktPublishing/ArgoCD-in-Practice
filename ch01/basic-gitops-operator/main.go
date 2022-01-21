package main

import (
	"fmt"
	"os"
	"os/exec"
	"path"
	"time"

	"github.com/go-git/go-git/v5"
)

func main() {
	timerSec := 30 * time.Second
	gitopsRepo := "https://github.com/lcostea/ArgoCD-in-Practice.git"
	localPath := "tmp/"
	pathToApply := "ch1/basic-gitops-operator-config"
	for {
		fmt.Println("start repo sync")
		err := syncRepo(gitopsRepo, localPath)
		if err != nil {
			fmt.Printf("repo sync error: %s", err)
			return
		}
		fmt.Println("start manifests apply")
		err = applyManifestsClient(path.Join(localPath, pathToApply))
		if err != nil {
			fmt.Printf("manifests apply error: %s", err)
		}
		syncTimer := time.NewTimer(timerSec)
		fmt.Printf("\n next sync in %s \n", timerSec)
		<-syncTimer.C
	}
}

func syncRepo(repoUrl, localPath string) error {
	_, err := git.PlainClone(localPath, false, &git.CloneOptions{
		URL:      repoUrl,
		Progress: os.Stdout,
	})

	if err != nil && err == git.ErrRepositoryAlreadyExists {
		repo, err := git.PlainOpen(localPath)
		if err != nil {
			return err
		}
		w, err := repo.Worktree()
		if err != nil {
			return err
		}
		err = w.Pull(&git.PullOptions{
			RemoteName: "origin",
			Progress:   os.Stdout,
		})
		// the library returns an "Already up to date" error if there is nothing to pull
		// but in our case we don't consider it an error
		if err != nil && err == git.NoErrAlreadyUpToDate {
			return nil
		}
		return err
	}
	return err
}

func applyManifestsClient(localPath string) error {
	dir, err := os.Getwd()
	if err != nil {
		return err
	}

	cmd := exec.Command("kubectl", "apply", "-f", path.Join(dir, localPath))
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	err = cmd.Run()
	return err
}
