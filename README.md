# bel-rdf-jena

This implements an RdfRepository plugin for [bel.rb](https://github.com/OpenBEL/bel.rb) using Apache Jena' TDB Storage. This plugin relies on [rdf-jena](https://github.com/abargnesi/rdf-jena) to interface with Apache Jena as an RDF.rb repository.

## Features

- Plugs in rdf-jena as an Rdf Repository plugin.
- `rdf-jena` executable that allows creation of Apache Jena TDB database.

## Requirements

- JRuby 1.7 or 9k series (due to rdf-jena).

## Install

First install the gem using:

```bash
gem install bel-rdf-jena
```

Now the plugin is installed and can be used by bel.rb.

## Getting started

### bel-rdf-jena executable

This gem includes an executable that can create an RDF database (Apache Jena TDB) from one or more RDF files.

You will have the `bel-rdf-jena` executable available to you (i.e. on your `PATH`) once you install this gem. Keep in mind that you may have to add `$GEM_HOME/bin` to your `PATH` to pick up installed executables.

Now to create an Apache Jena TDB database provide a directory and one or more.

Example:

```bash
bel-rdf-jena --dir /opt/data/resources_rdf --file biological-concepts-rdf.ttl
```

Note: It may take a while to load your RDF data. Apache Jena does a good job of balancing performance and memory allocation. You can increase memory allocation for the process by specifying the `-J-Xmx4g` (i.e. max heap size of 4 Gb) option in `JRUBY_OPTS`.

Example:

```bash
JRUBY_OPTS="-J-Xmx4g" bel-rdf-jena --dir /opt/data/resources_rdf --file biological-concepts-rdf.ttl
```

Tip: For the `biological-concepts-rdf.ttl` file found on the [OpenBEL build server](http://build.openbel.org/browse/OR) try setting this to `-J-Xmx4g` or `-J-Xmx8g` if possible.

### Plugin to bel.rb for accessing Annotations and Namespaces

bel.rb provides an [approach to plugins](https://github.com/OpenBEL/bel.rb/wiki/Plugins-in-bel.rb) that is meant to be uncomplicated. The following steps will get you started:

- Build gem with `gem build .gemspec` and install with `gem install bel-rdf-jena-0.4.0.beta1-java.gem`.
- Now you have this plugin installed and ready for use in bel.rb!
- With bel.rb installed run the command `bel plugins` to list available plugins.

```bash
$ bel plugins

RDF Repository plugins
----------------------

 Name:        Apache Jena RDF Repository
 Description: A repository of RDF data on Apache Jena using TDB storage.
```

- To create the search implementation in Ruby try:

```ruby
rdf_jena_plugin = BEL::RdfRepository.plugins[:jena]

rdf_jena_plugin.create_repository(:tdb_directory => 'data')
```

- Enjoy access to RDF datasets through Apache Jena!
