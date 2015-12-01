module BEL::RdfRepository::Plugins

  module Jena

    extend ::BEL::RdfRepository::ClassMethods

    NAME        = 'Apache Jena RDF Repository'
    DESCRIPTION = 'A repository of RDF data on Apache Jena using TDB storage.'

    def self.create_repository(options = {})
      require 'rdf/jena'

      tdb_directory = options.delete(:tdb_directory)
      unless tdb_directory
        raise ArgumentError.new(
          "The :tdb_directory option is required (pointing to a TDB storage directory)."
        )
      end

      RDF::Jena::Repository.new(tdb_directory)
    end

    def self.name
      NAME
    end

    def self.description
      DESCRIPTION
    end
  end
end
