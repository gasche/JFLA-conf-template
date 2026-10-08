
Here is simple information to know how to run the test of the template.

We use the [just](https://github.com/casey/just) command runner that can be seen
as a striped down Makefile. The useful command are in the `justfile` at the root
of this directory. 

To build the example run this command :
```
just compile-examples
```
The example are compiled into the `build` directory that is ignored by out
.gitignore.


To build the thumbnail run this command :
```
just thumbnail
```

To clean all the build file run this command :
```
just clean
```


