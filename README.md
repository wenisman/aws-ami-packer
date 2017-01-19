**Folder naming convention**

*This should evolve over time*

* Every image has it's own folder directly beneath the root.
* The folder should be called exactly the same as the base AMI, replacing spaces with '.'
* Subfolders should be called the purpose of the AMI.
* Subfolders always use the ami generated in the parent folder as a base image.

```
Microsoft.Windows.Server.2012.R2.Base
|- iis
|- phonebet

Amazon.Linux.AMI
|- ruby
|- kafka
```
