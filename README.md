#srx2text

##Stuff about `srx2text` and `query-sparql`

`srx2text` is a tiny Perl script that parses an `srx` file and formats it as a
table.

Comes with a handy utility: `query-sparql`, a Bash script that runs a query on
a remote SPARQL endpoint from a file. So that you can use your favorite editor
(vim, emacs, whatever) to edit SPARQL queries, query the remote endpoint and
have a nicely formatted table.

There are some example `srx` files in the folder `examples`: for example, the
file `test.srx` which was obtained from the query

    SELECT ?s ?p ?o
    WHERE {
        GRAPH <http://dbpedia.org> {
            ?s ?p ?o
        }
    }
    LIMIT 10
on `dbpedia.org` and the file `test.sparql` containing this query:

    #!/usr/local/bin/query-sparql
    
    ### These options are passed as options to query-sparql!
    ###-h dbpedia.org
    ###-p 80
    ###--default-graph-uri=http://dbpedia.org
    
    SELECT ?s ?p ?o
    WHERE {
       ?s ?p ?o
    }
    LIMIT 10
    
    # vim: set filetype=sparql :

Play with it:

    $ ./query-sparql examples/test.sparql
    ...
    ... outputs the results of the query in xml ...
    ...

The file `test.srx` contains the previous dump, and look:

    $ ./srx2text examples/test.srx
    ┌──────────────────────────────────────────────────────────────────────────┬────┬───────────┐
    │ ?s                                                                       │ ?p │ ?o        │
    ├──────────────────────────────────────────────────────────────────────────┼────┼───────────┤
    │ <http://dbpedia.org/resource/!Action_Pact!>                              │ a  │ owl:Thing │
    │ <http://dbpedia.org/resource/%22Solidarity%22_Szczecin-Goleniów_Airport> │ a  │ owl:Thing │
    │ <http://dbpedia.org/resource/%22The_Take_Over,_the_Breaks_Over%22>       │ a  │ owl:Thing │
    │ <http://dbpedia.org/resource/Ágætis_byrjun>                              │ a  │ owl:Thing │
    │ <http://dbpedia.org/resource/Ákos_Ráthonyi>                              │ a  │ owl:Thing │
    │ <http://dbpedia.org/resource/Álvaro_Arzú>                                │ a  │ owl:Thing │
    │ <http://dbpedia.org/resource/Álvaro_Colom>                               │ a  │ owl:Thing │
    │ <http://dbpedia.org/resource/Álvaro_Rafael_González>                     │ a  │ owl:Thing │
    │ <http://dbpedia.org/resource/Álvaro_de_Castro>                           │ a  │ owl:Thing │
    │ <http://dbpedia.org/resource/Ángel_Berlanga>                             │ a  │ owl:Thing │
    └──────────────────────────────────────────────────────────────────────────┴────┴───────────┘
    10 results
    $ ./query-sparql examples/test.sparql | ./srx2text
    ┌──────────────────────────────────────────────────────────────────────────┬────┬───────────┐
    │ ?s                                                                       │ ?p │ ?o        │
    ├──────────────────────────────────────────────────────────────────────────┼────┼───────────┤
    │ <http://dbpedia.org/resource/!Action_Pact!>                              │ a  │ owl:Thing │
    │ <http://dbpedia.org/resource/%22Solidarity%22_Szczecin-Goleniów_Airport> │ a  │ owl:Thing │
    │ <http://dbpedia.org/resource/%22The_Take_Over,_the_Breaks_Over%22>       │ a  │ owl:Thing │
    │ <http://dbpedia.org/resource/Ágætis_byrjun>                              │ a  │ owl:Thing │
    │ <http://dbpedia.org/resource/Ákos_Ráthonyi>                              │ a  │ owl:Thing │
    │ <http://dbpedia.org/resource/Álvaro_Arzú>                                │ a  │ owl:Thing │
    │ <http://dbpedia.org/resource/Álvaro_Colom>                               │ a  │ owl:Thing │
    │ <http://dbpedia.org/resource/Álvaro_Rafael_González>                     │ a  │ owl:Thing │
    │ <http://dbpedia.org/resource/Álvaro_de_Castro>                           │ a  │ owl:Thing │
    │ <http://dbpedia.org/resource/Ángel_Berlanga>                             │ a  │ owl:Thing │
    └──────────────────────────────────────────────────────────────────────────┴────┴───────────┘
    10 results

Make sure you read the help files to learn about the options:

    ./srx2text --help
    ./query-sparql --help

##Inline options

The script `query-sparql` will make your querying experience much better as you
can inline options in your `.sparql` file. E.g., `test.sparql` has these lines:

    ###-h dbpedia.org
    ###-p 80

These lines are parsed by `query-sparql` before running the query and
interpreted as an option. This makes it handy to make an executable `.sparql`
file with a shebang `#!/usr/local/bin/query-sparql`. So that, after installing
`query-sparql` and `srx2text` in `/usr/local/bin` you can issue:

    $ examples/test.sparql | srx2text
and you'll get your results in a nice table on the terminal.

##Standard compliance

The reference for `srx` files is (as of now):
[SPARQL Query Results XML Format (Second Edition), W3C Recommendation 21 March 2013](http://www.w3.org/TR/rdf-sparql-XMLres/).
Our goal is to be 100% compliant with the standard. I have only very quickly
scanned the document so this goal might not be completely reached as of now
(but close enough); feel free to complain and/or contribute!

Author:
- Gniourf Gniourf <gniourfgniourf@gmail.com>.

