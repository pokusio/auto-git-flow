# Auto Git Flow


## Bump it

* NVIE himself talking about the bump : 
> 
> Bumping refers to the act of increasing your version number. As far as branches are concerned, gitflow does this automatically for you. But your application (or whatever you are versioning) probably wants to know which version it currently is. This is something that you still need to do manually, of course.
> 
> When gitflow reports that you should "bump your version number now", it means this: update your files manually so that they reflect the correct version number.
>
> _https://github.com/nvie/gitflow/issues/26#issuecomment-222459_
> 

* Another person clarifies NVIE 's explanations about the bump : 
> 
> @Dmaster420 no nvie actually means find the location in your code base where you might describe the version and increment it yourself.
> 
> for example, within my `django` applications I typically store the version in the base init.py file :
> 
> https://github.com/airtonix/django-ikari/blob/master/ikari/__init__.py
> 
> then i use that in the `setup.py`:
> 
> https://github.com/airtonix/django-ikari/blob/> master/setup.py#L8
> 
> In my case, nvie is saying : "edit the init.py and change it from `0.0.8` to `0.0.9` (or whatever your release version is)
> 
> **_However there exists a forked version of git-flow that provides hooks where you can automate this_**.
> 
> _https://github.com/nvie/gitflow/issues/26#issuecomment-26188731_
> 




**So here, the idea is that bumping the version should naturally be configured as a git hook : should we use husky, or write an AVH extension?**

If yes, it should be a pre-commit hook, that the git flow release will trigger, with the commit (will the additional squash trigger the bump a second time ?)

to test that, i will :
* add a pre-commit hook, which will : 
  * 
* and run that test for major, minor, and patch releases for LTS sts support

means we also need a support LTS / STS policy : 
* 6 months for STS' : all minor releases
* 3 years for LTS' : all *.5 releases