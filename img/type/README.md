# `type`

## Table of contents

- [Summary](#summary)
- [Tools](#tools)
- [Manual](#manual)
  - [`quicktype`](#quicktype)
  - [`json2ts`](#json2ts)
- [Usage](#usage)
- [Third party software](#third-party-software)

## Summary

Base image containing tools to work with types.

## Tools

- `quicktype` - <https://github.com/glideapps/quicktype>
- `json2ts` - <https://github.com/bcherny/json-schema-to-typescript>

## Manual

### `quicktype`

``` text
$ quicktype --help
Synopsis

  $ quicktype [--lang LANG] [--src-lang SRC_LANG] [--out FILE] FILE|URL ...     
                                                                                
  LANG ... cjson|c++|cr|cs|dart|elixir|elm|flow|go|haskell|java|js|javascript-  
  prop-                                                                         
  types|schema|kotlin|objc|php|pike|py|ruby|rs|scala3|smithy4a|swift|ts|typescript- 
  effect-schema|typescript-zod                                                  
                                                                                
  SRC_LANG ... json|schema|graphql|postman|typescript                           

Description

  Given JSON sample data, quicktype outputs code for working with that data in  
  C (cJSON), C++, Crystal, C#, Dart, Elixir, Elm, Flow, Go, Haskell, Java,      
  JavaScript, JavaScript PropTypes, JSON Schema, Kotlin, Objective-C, PHP,      
  Pike, Python, Ruby, Rust, Scala3, Smithy, Swift, TypeScript, TypeScript       
  Effect Schema, TypeScript Zod.                                                

Options

 -o, --out FILE                                              The output file. Determines --lang and --top-level.        
 -t, --top-level NAME                                        The name for the top level type.                           
 -l, --lang LANG                                             The target language.                                       
 -s, --src-lang SRC_LANG                                     The source language (default is json).                     
 --src FILE|URL|DIRECTORY                                    The file, url, or data directory to type.                  
 --src-urls FILE                                             Tracery grammar describing URLs to crawl.                  
 --no-maps string                                            Don't infer maps, always use classes.                      
 --no-enums string                                           Don't infer enums, always use strings.                     
 --no-uuids string                                           Don't convert UUIDs to UUID objects.                       
 --no-date-times string                                      Don't infer dates or times.                                
 --no-integer-strings string                                 Don't convert stringified integers to integers.            
 --no-boolean-strings string                                 Don't convert stringified booleans to booleans.            
 --no-combine-classes string                                 Don't combine similar classes.                             
 --no-ignore-json-refs string                                Treat $ref as a reference in JSON.                         
 --graphql-schema FILE                                       GraphQL introspection file.                                
 --graphql-introspect URL                                    Introspect GraphQL schema from a server.                   
 --http-method METHOD                                        HTTP method to use for the GraphQL introspection query.    
 --http-header HEADER                                        Header(s) to attach to all HTTP requests, including the    
                                                             GraphQL introspection query.                               
 -S, --additional-schema FILE                                Register the $id's of additional JSON Schema files.        
 --alphabetize-properties string                             Alphabetize order of class properties.                     
 --all-properties-optional string                            Make all class properties optional.                        
 --quiet string                                              Don't show issues in the generated code.                   
 --debug OPTIONS or all                                      Comma separated debug options: print-graph, print-         
                                                             reconstitution, print-gather-names, print-transformations, 
                                                             print-schema-resolving, print-times, provenance            
 --telemetry enable|disable                                  Enable anonymous telemetry to help improve quicktype       
 -h, --help string                                           Get some help.                                             
 -v, --version string                                        Display the version of quicktype                           

Options for C (cJSON)

 --source-style single-source|multi-source                   Source code generation type, whether to generate single or 
                                                             multiple source files                                      
 --integer-size int8_t|int16_t|int32_t|int64_t               Integer code generation type (int64_t by default)          
 --hashtable-size SIZE                                       Hashtable size, used when maps are created (64 by default) 
 --typedef-alias no-typedef|add-typedef                      Add typedef alias to unions, structs, and enums (no        
                                                             typedef by default)                                        
 --print-style print-formatted|print-unformatted             Which cJSON print should be used (formatted by default)    
 --type-style pascal-case|underscore-case|camel-case|upper-  Naming style for types                                     
 underscore-case|pascal-case-upper-acronyms|camel-case-                                                                 
 upper-acronyms                                                                                                         
 --member-style pascal-case|underscore-case|camel-           Naming style for members                                   
 case|upper-underscore-case|pascal-case-upper-                                                                          
 acronyms|camel-case-upper-acronyms                                                                                     
 --enumerator-style pascal-case|underscore-case|camel-       Naming style for enumerators                               
 case|upper-underscore-case|pascal-case-upper-                                                                          
 acronyms|camel-case-upper-acronyms                                                                                     

Options for C++

 --source-style single-source|multi-source                   Source code generation type,  whether to generate single   
                                                             or multiple source files                                   
 --include-location local-include|global-include             Whether json.hpp is to be located globally or locally      
 --code-format with-struct|with-getter-setter                Generate classes with getters/setters, instead of structs  
 --wstring use-string|use-wstring                            Store strings using Utf-16 std::wstring, rather than Utf-8 
                                                             std::string                                                
 --const-style west-const|east-const                         Put const to the left/west (const T) or right/east (T      
                                                             const)                                                     
 --[no-]just-types string                                    Plain types only (off by default)                          
 --namespace NAME                                            Name of the generated namespace(s)                         
 --enum-type NAME                                            Type of enum class                                         
 --type-style pascal-case|underscore-case|camel-case|upper-  Naming style for types                                     
 underscore-case|pascal-case-upper-acronyms|camel-case-                                                                 
 upper-acronyms                                                                                                         
 --member-style pascal-case|underscore-case|camel-           Naming style for members                                   
 case|upper-underscore-case|pascal-case-upper-                                                                          
 acronyms|camel-case-upper-acronyms                                                                                     
 --enumerator-style pascal-case|underscore-case|camel-       Naming style for enumerators                               
 case|upper-underscore-case|pascal-case-upper-                                                                          
 acronyms|camel-case-upper-acronyms                                                                                     
 --[no-]boost string                                         Require a dependency on boost. Without boost, C++17 is     
                                                             required (on by default)                                   
 --[no-]hide-null-optional string                            Hide null value for optional field (off by default)        

Options for C#

 --framework NewtonSoft|SystemTextJson                       Serialization framework                                    
 --array-type array|list                                     Use T[] or List<T>                                         
 --density normal|dense                                      Property density                                           
 --namespace NAME                                            Generated namespace                                        
 --csharp-version 5|6                                        C# version                                                 
 --[no-]virtual string                                       Generate virtual properties (off by default)               
 --any-type object|dynamic                                   Type to use for "any"                                      
 --number-type double|decimal                                Type to use for numbers                                    
 --features complete|attributes-only|just-types-and-         Output features                                            
 namespace|just-types                                                                                                   
 --base-class EntityData|Object                              Base class                                                 
 --[no-]check-required string                                Fail if required properties are missing (off by default)   
 --[no-]keep-property-name string                            Keep original field name generate (off by default)         

Options for Dart

 --[no-]null-safety string                                   Null Safety (on by default)                                
 --[no-]just-types string                                    Types only (off by default)                                
 --[no-]coders-in-class string                               Put encoder & decoder in Class (off by default)            
 --[no-]from-map string                                      Use method names fromMap() & toMap() (off by default)      
 --[no-]required-props string                                Make all properties required (off by default)              
 --[no-]final-props string                                   Make all properties final (off by default)                 
 --[no-]copy-with string                                     Generate CopyWith method (off by default)                  
 --[no-]use-freezed string                                   Generate class definitions with @freezed compatibility     
                                                             (off by default)                                           
 --[no-]use-hive string                                      Generate annotations for Hive type adapters (off by        
                                                             default)                                                   
 --[no-]use-json-annotation string                           Generate annotations for json_serializable (off by         
                                                             default)                                                   
 --part-name NAME                                            Use this name in `part` directive                          

Options for Elixir

 --[no-]just-types string                                    Plain types only (off by default)                          
 --namespace NAME                                            Specify a module namespace                                 

Options for Elm

 --[no-]just-types string                                    Plain types only (off by default)                          
 --array-type array|list                                     Use Array or List                                          
 --module NAME                                               Generated module name                                      

Options for Flow

 --acronym-style original|pascal|camel|lowerCase             Acronym naming style                                       
 --[no-]runtime-typecheck string                             Verify JSON.parse results at runtime (on by default)       
 --[no-]runtime-typecheck-ignore-unknown-properties string   Ignore unknown properties when verifying at runtime (off   
                                                             by default)                                                
 --converters top-level|all-objects                          Which converters to generate (top-level by default)        
 --raw-type json|any                                         Type of raw input (json by default)                        
 --[no-]just-types string                                    Interfaces only (off by default)                           
 --[no-]nice-property-names string                           Transform property names to be JavaScripty (off by         
                                                             default)                                                   
 --[no-]explicit-unions string                               Explicitly name unions (off by default)                    
 --[no-]prefer-unions string                                 Use union type instead of enum (off by default)            
 --[no-]prefer-types string                                  Use types instead of interfaces (off by default)           
 --[no-]prefer-const-values string                           Use string instead of enum for string enums with single    
                                                             value (off by default)                                     
 --[no-]readonly string                                      Use readonly type members (off by default)                 

Options for Go

 --[no-]just-types string                                    Plain types only (off by default)                          
 --[no-]just-types-and-package string                        Plain types with package only (off by default)             
 --package NAME                                              Generated package name                                     
 --[no-]multi-file-output string                             Renders each top-level object in its own Go file (off by   
                                                             default)                                                   
 --field-tags TAGS                                           list of tags which should be generated for fields          
 --[no-]omit-empty string                                    If set, all non-required objects will be tagged with       
                                                             ",omitempty" (off by default)                              

Options for Haskell

 --[no-]just-types string                                    Plain types only (off by default)                          
 --array-type array|list                                     Use Array or List                                          
 --module NAME                                               Generated module name                                      

Options for Java

 --array-type array|list                                     Use T[] or List<T>                                         
 --[no-]just-types string                                    Plain types only (off by default)                          
 --datetime-provider java8|legacy                            Date time provider type                                    
 --acronym-style original|pascal|camel|lowerCase             Acronym naming style                                       
 --package NAME                                              Generated package name                                     
 --[no-]lombok string                                        Use lombok (off by default)                                
 --[no-]lombok-copy-annotations string                       Copy accessor annotations (on by default)                  

Options for JavaScript

 --acronym-style original|pascal|camel|lowerCase             Acronym naming style                                       
 --[no-]runtime-typecheck string                             Verify JSON.parse results at runtime (on by default)       
 --[no-]runtime-typecheck-ignore-unknown-properties string   Ignore unknown properties when verifying at runtime (off   
                                                             by default)                                                
 --converters top-level|all-objects                          Which converters to generate (top-level by default)        
 --raw-type json|any                                         Type of raw input (json by default)                        

Options for JavaScript PropTypes

 --acronym-style original|pascal|camel|lowerCase             Acronym naming style                                       
 --converters top-level|all-objects                          Which converters to generate (top-level by default)        
 --module-system common-js|es6                               Which module system to use                                 

Options for Kotlin

 --framework just-types|jackson|klaxon|kotlinx               Serialization framework                                    
 --acronym-style original|pascal|camel|lowerCase             Acronym naming style                                       
 --package PACKAGE                                           Package                                                    

Options for Objective-C

 --features all|interface|implementation                     Interface and implementation                               
 --[no-]just-types string                                    Plain types only (off by default)                          
 --[no-]functions string                                     C-style functions (off by default)                         
 --class-prefix PREFIX                                       Class prefix                                               
 --[no-]extra-comments string                                Extra comments (off by default)                            

Options for PHP

 --[no-]with-get string                                      Create Getter (on by default)                              
 --[no-]fast-get string                                      getter without validation (off by default)                 
 --[no-]with-set string                                      Create Setter (off by default)                             
 --[no-]with-closing string                                  PHP Closing Tag (off by default)                           
 --acronym-style original|pascal|camel|lowerCase             Acronym naming style                                       

Options for Python

 --python-version 3.5|3.6|3.7                                Python version                                             
 --[no-]just-types string                                    Classes only (off by default)                              
 --[no-]nice-property-names string                           Transform property names to be Pythonic (on by default)    
 --[no-]pydantic-base-model string                           Uses pydantic BaseModel (off by default)                   

Options for Ruby

 --[no-]just-types string                                    Plain types only (off by default)                          
 --strictness strict|coercible|none                          Type strictness                                            
 --namespace NAME                                            Specify a wrapping Namespace                               

Options for Rust

 --density normal|dense                                      Density                                                    
 --visibility private|crate|public                           Field visibility                                           
 --[no-]derive-debug string                                  Derive Debug impl (off by default)                         
 --[no-]derive-clone string                                  Derive Clone impl (off by default)                         
 --[no-]derive-partial-eq string                             Derive PartialEq impl (off by default)                     
 --[no-]skip-serializing-none string                         Skip serializing empty Option fields (off by default)      
 --[no-]edition-2018 string                                  Edition 2018 (on by default)                               
 --[no-]leading-comments string                              Leading Comments (on by default)                           

Options for Scala3

 --framework just-types|circe|upickle                        Serialization framework                                    
 --package PACKAGE                                           Package                                                    

Options for Smithy

 --framework just-types                                      Serialization framework                                    
 --package PACKAGE                                           Package                                                    

Options for Swift

 --[no-]just-types string                                    Plain types only (off by default)                          
 --[no-]initializers string                                  Generate initializers and mutators (on by default)         
 --[no-]coding-keys string                                   Explicit CodingKey values in Codable types (on by default) 
 --coding-keys-protocol protocol1, protocol2...              CodingKeys implements protocols                            
 --[no-]alamofire string                                     Alamofire extensions (off by default)                      
 --type-prefix PREFIX                                        Prefix for type names                                      
 --struct-or-class struct|class                              Structs or classes                                         
 --[no-]mutable-properties string                            Use var instead of let for object properties (off by       
                                                             default)                                                   
 --acronym-style original|pascal|camel|lowerCase             Acronym naming style                                       
 --density dense|normal                                      Code density                                               
 --[no-]support-linux string                                 Support Linux (off by default)                             
 --[no-]objective-c-support string                           Objects inherit from NSObject and @objcMembers is added to 
                                                             classes (off by default)                                   
 --[no-]optional-enums string                                If no matching case is found enum value is set to null     
                                                             (off by default)                                           
 --[no-]swift-5-support string                               Renders output in a Swift 5 compatible mode (off by        
                                                             default)                                                   
 --[no-]sendable string                                      Mark generated models as Sendable (off by default)         
 --[no-]multi-file-output string                             Renders each top-level object in its own Swift file (off   
                                                             by default)                                                
 --access-level internal|public                              Access level                                               
 --protocol none|equatable|hashable                          Make types implement protocol                              

Options for TypeScript

 --acronym-style original|pascal|camel|lowerCase             Acronym naming style                                       
 --[no-]runtime-typecheck string                             Verify JSON.parse results at runtime (on by default)       
 --[no-]runtime-typecheck-ignore-unknown-properties string   Ignore unknown properties when verifying at runtime (off   
                                                             by default)                                                
 --converters top-level|all-objects                          Which converters to generate (top-level by default)        
 --raw-type json|any                                         Type of raw input (json by default)                        
 --[no-]just-types string                                    Interfaces only (off by default)                           
 --[no-]nice-property-names string                           Transform property names to be JavaScripty (off by         
                                                             default)                                                   
 --[no-]explicit-unions string                               Explicitly name unions (off by default)                    
 --[no-]prefer-unions string                                 Use union type instead of enum (off by default)            
 --[no-]prefer-types string                                  Use types instead of interfaces (off by default)           
 --[no-]prefer-const-values string                           Use string instead of enum for string enums with single    
                                                             value (off by default)                                     
 --[no-]readonly string                                      Use readonly type members (off by default)                 

Examples

  Generate C# to parse a Bitcoin API                                            
  $ quicktype -o LatestBlock.cs https://blockchain.info/latestblock             
                                                                                
  Generate Go code from a directory of samples containing:                      
  - Foo.json                                                                    
  + Bar                                                                         
  - bar-sample-1.json                                                           
  - bar-sample-2.json                                                           
  - Baz.url                                                                     
  $ quicktype -l go samples                                                     
                                                                                
  Generate JSON Schema, then TypeScript                                         
  $ quicktype -o schema.json https://blockchain.info/latestblock                
  $ quicktype -o bitcoin.ts --src-lang schema schema.json                       

  Learn more at quicktype.io
```

### `json2ts`

``` text
$ json2ts --help
json-schema-to-typescript 15.0.4
Usage: json2ts [--input, -i] [IN_FILE] [--output, -o] [OUT_FILE] [OPTIONS]

With no IN_FILE, or when IN_FILE is -, read standard input.
With no OUT_FILE and when IN_FILE is specified, create .d.ts file in the same directory.
With no OUT_FILE nor IN_FILE, write to standard output.

You can use any of the following options by adding them at the end.
Boolean values can be set to false using the 'no-' prefix.

  --additionalProperties
      Default value for additionalProperties, when it is not explicitly set
  --cwd=XXX
      Root directory for resolving $ref
  --declareExternallyReferenced
      Declare external schemas referenced via '$ref'?
  --enableConstEnums
      Prepend enums with 'const'?
  --inferStringEnumKeysFromValues
      Create enums from JSON enums instead of union types
  --format
      Format code? Set this to false to improve performance.
  --maxItems
      Maximum number of unioned tuples to emit when representing bounded-size
      array types, before falling back to emitting unbounded arrays. Increase
      this to improve precision of emitted types, decrease it to improve
      performance, or set it to -1 to ignore minItems and maxItems.
  --style.XXX=YYY
      Prettier configuration
  --unknownAny
      Output unknown type instead of any type
  --unreachableDefinitions
      Generates code for definitions that aren't referenced by the schema
```

## Usage

Use it to generate types from **JSON** schemas.

## Third party software

This container image includes the following third-party components:

- **quicktype** (<https://github.com/glideapps/quicktype>) — licensed under Apache-2.0
  <https://github.com/glideapps/quicktype/blob/master/LICENSE> - no modifications made.

- **json-schema-to-typescript** (<https://github.com/bcherny/json-schema-to-typescript>) — licensed under MIT
  Copyright (c) Boris Cherny <https://github.com/bcherny/json-schema-to-typescript/blob/master/LICENCE.md> - no
  modifications made.
