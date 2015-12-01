# bel-rdf-jena

This implements an RdfRepository plugin for [bel.rb](https://github.com/OpenBEL/bel.rb) using Apache Jena' TDB Storage. This plugin relies on [rdf-jena](https://github.com/abargnesi/rdf-jena) to interface with Apache Jena as an RDF.rb repository.

## Features

- Plugs in rdf-jena as an Rdf Repository plugin.

## Requirements

- JRuby 1.7 or 9k series (due to rdf-jena).

How can I use this?
------------------

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
