puppet-consul
=============

A Puppet module to install and start Consul

consul

This is the consul module.

# FAQ

### Why are you shipping the Consul binary files in the files directory?
I don't know of any OS packages that I could use with a package resource. Also, they are each about 13MB which means that the whole module is still less than 60MB and there are no additional dependencies.


License
-------
MIT

Contact
-------


Support
-------

Please log tickets and issues at my [Projects site](https://github.com/klynton/puppet-consul)

I'm happy to take pull requests and code reviews.
