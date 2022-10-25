# Argo CD in Practice

<a href="https://www.packtpub.com/product/argo-cd-in-practice/9781803233321?utm_source=github&utm_medium=repository&utm_campaign=9781803233321"><img src="https://static.packt-cdn.com/products/9781803233321/cover/smaller" alt="Early Access" height="256px" align="right"></a>

This is the code repository for [Argo CD in Practice](https://www.packtpub.com/product/argo-cd-in-practice/9781803233321?utm_source=github&utm_medium=repository&utm_campaign=9781803233321), published by Packt.

**The GitOps way of managing cloud-native applications**

## What is this book about?
GitOps follows the practices of infrastructure as code (IaC), allowing developers to use their day-to-day tools and practices such as source control and pull requests to manage apps. With this book, you’ll understand how to apply GitOps bootstrap clusters in a repeatable manner, build CD pipelines for cloud native apps running on Kubernetes, and minimize the failure of deployments. 

This book covers the following exciting features:
Understand GitOps principles and how they relate to IaC
Discover how Argo CD sets the background for reconciling Git state with the cluster state
Run Argo CD in production with an emphasis on reliability and troubleshooting
Bootstrap Kubernetes clusters with essential utilities following the GitOps approach
Set up a CD pipeline and minimize the failure of deployments
Explore ways to verify and validate the YAML you put together when working with Kubernetes
Understand the democratization of GitOps and how the GitOps engine will enable its further adoption

If you feel this book is for you, get your [copy](https://www.amazon.com/dp/180323332X) today!

<a href="https://www.packtpub.com/?utm_source=github&utm_medium=banner&utm_campaign=GitHubBanner"><img src="https://raw.githubusercontent.com/PacktPublishing/GitHub/master/GitHub.png" 
alt="https://www.packtpub.com/" border="5" /></a>

## Instructions and Navigations
All of the code is organized into folders. For example, ch01.

The code will look like the following:
```
apiVersion: v1
kind: ConfigMap
metadata:
  name: argocd-cm
data:
  accounts.alina: apiKey, login
```

**Following is what you need for this book:**
If you’re a software developer, DevOps engineer, or SRE who is responsible for building CD pipelines for projects running on Kubernetes and wants to advance in your career, this book is for you. Basic knowledge of Kubernetes, Helm, or Kustomize and CD pipelines will help you to get the most out of this book.

With the following software and hardware list you can run all code files present in the book (Chapter 1-9).
### Software and Hardware List
| Software required | OS required |
| ------------------------------------ | ----------------------------------- |
| Argo CD v2.1 and v2.2 | Windows, macOS, or Linux |


We also provide a PDF file that has color images of the screenshots/diagrams used in this book. [Click here to download it](https://packt.link/HfXCL).

### Related products
* The Kubernetes Bible [[Packt]](https://www.packtpub.com/product/the-kubernetes-bible/9781838827694?utm_source=github&utm_medium=repository&utm_campaign=9781838827694) [[Amazon]](https://www.amazon.com/dp/1838827692)

* Learning DevOps - Second Edition [[Packt]](https://www.packtpub.com/product/learning-devops-second-edition/9781801818964?utm_source=github&utm_medium=repository&utm_campaign=9781801818964) [[Amazon]](https://www.amazon.com/dp/1801818967)

## Get to Know the Authors
**Spiros Economakis**
started as a Software Engineer in 2010 and went through a series of jobs and roles from Software Engineer, Software Architect to Head of Cloud. In 2013 founded its own startup and that was the first touch with DevOps culture and built with a small team a couple of CI/CD pipelines for a microservice architecture and mobile apps releases. After this in most of the companies involved to influence DevOps culture and automation.

In 2019 started as an SRE in Lenses (acquired by Celonis) and soon influenced the organization with Kubernetes, GitOps, Cloud and transitioned to a position as Head of Cloud where he introduced GitOps across the whole company and used Argo CD for bootstrapping k8s clusters with utilities and continuous delivery applications. Now he works in an open-source company which is called Mattermost as a Senior Engineering Manager/SRE where he transformed the old GitOps approach (fluxcd) to GitOps v2.0 with Argo CD and built a scalable architecture for multi-tenancy.


**Liviu Costea**
started as a developer in the early 2000 and his career path took him to different roles from Developer to Coding Architect and from Team Lead to CTO. In 2012 he transitioned to DevOps, when at a small company, someone had to start working on pipelines and automation because the traditional way wasn’t scalable anymore.

In 2018 he started with the Platform Team and then he was the Tech Lead in the Release Team at Mambu, where they designed most of the CI/CD pipelines, adopting GitOps practices. They have been live with Argo CD since 2019. More recently he joined Juni, a promising startup, where they are planning the GitOps adoption. For his contributions to OSS projects, including Argo CD, he was named CNCF Ambassador in August 2020.

### Download a free PDF

 <i>If you have already purchased a print or Kindle version of this book, you can get a DRM-free PDF version at no cost.<br>Simply click on the link to claim your free PDF.</i>
<p align="center"> <a href="https://packt.link/free-ebook/9781803233321">https://packt.link/free-ebook/9781803233321 </a> </p>