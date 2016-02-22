Gem::Specification.new do |spec|
  spec.name                     = 'bel-rdf-jena'
  spec.version                  = '0.4.2'
  spec.summary                  = """
                                    Rdf Repository plugin for bel.rb using Apache Jena.
                                  """.gsub(%r{^\s+}, ' ').gsub(%r{\n}, '')
  spec.description              = """
                                    An rdf repository plugin for bel.rb that uses Apache Jena's
                                    TDB data storage to support default and named graphs.
                                  """.gsub(%r{^\s+}, ' ').gsub(%r{\n}, '')
  spec.license                  = 'Apache-2.0'
  spec.authors                  = [
                                    'Anthony Bargnesi',
                                  ]
  spec.email                    = [
                                    'abargnesi@selventa.com',
                                  ]
  spec.files                    = [
                                    Dir.glob('lib/**/*.{rb}'),
                                    __FILE__,
                                    'CHANGELOG.md',
                                    'LICENSE',
                                    'INSTALL.md',
                                    'INSTALL_RUBY.md',
                                    'README.md',
                                  ].flatten!
  spec.executables              = Dir.glob('bin/*').map(&File.method(:basename))
  spec.homepage                 = 'https://github.com/OpenBEL/bel.rb-rdf-jena'
  spec.rdoc_options             = [
                                    '--title', 'BEL Rdf Repository - Apache Jena',
                                    '--main', 'README.md',
                                    '--line-numbers',
                                    'CHANGELOG.md',
                                    'LICENSE',
                                    'INSTALL.md',
                                    'INSTALL_RUBY.md',
                                    'README.md',
                                  ]

  spec.platform                 = 'java'
  spec.add_runtime_dependency     'bel',      '>= 0.4.0', '< 1.0.0'
  spec.add_runtime_dependency     'rdf-jena', '0.3.4'
  spec.post_install_message     = %Q{
******************************
*  bel-rdf-jena plugin       *
******************************
Thank you for installing the bel-rdf-jena plugin to bel.rb.

This plugin runs on JRuby and provides in-process access to
Apache Jena TDB datasets. This provides you the ability to
query/update default and named graphs.

To verify the bel-rdf-jena plugin can be used by bel.rb
execute the bel.rb command:

    bel plugins --list

To access this within bel.rb execute the following ruby code:

    require 'bel'
    rdf_jena_plugin = BEL::RdfRepository.plugins[:jena]
    rdf_jena_plugin.create_repository(:tdb_directory => 'data')

}
end
# vim: ft=ruby ts=2 sw=2:
# encoding: utf-8
