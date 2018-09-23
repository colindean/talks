# JSON at the Command Line

## [jq](https://stedolan.github.io/jq)

All-in-one JSON querying and restructuring tool. Takes JSON, spits out JSON or raw strings based on its own, complex query language.

```
$ echo '[{"id": "first", "val": 1}, {"id": "second", "val": 2}]' | jq '.[] | select(.id == "second")'
{"id": "second", "val": 2}
```

**jq** is available in the default image on a few cloud-based continuous integration systems. It's commonly installed on macOS and Linux developer systems, too.

## [jo](https://github.com/jpmens/jo)

Creates JSON from simple command line key=value pairs and correctly builds objects for nested invocations.

```
$ jo -p name=jo n=17 parser=false
{
    "name": "jo",
    "n": 17,
    "parser": false
}
```

Easily create arrays:

```
$ seq 1 10 | jo -a
[1,2,3,4,5,6,7,8,9,10]
```

Call it more than once to create objects:

```
$ jo -p name=JP object=$(jo fruit=Orange hungry@0 point=$(jo x=10 y=20 list=$(jo -a 1 2 3 4 5)) number=17) sunday@0
{
 "name": "JP",
 "object": {
  "fruit": "Orange",
  "hungry": false,
  "point": {
   "x": 10,
   "y": 20,
   "list": [
    1,
    2,
    3,
    4,
    5
   ]
  },
  "number": 17
 },
 "sunday": false
}
```

## [Gron](https://github.com/tomnomnom/gron)

Flattens JSON to dot notation so it can be used with tools that can operate on key=value pairs, or just text. It converts this structure back to JSON afterward as a pipe operation, too.

```
$ gron "https://api.github.com/repos/tomnomnom/gron/commits?per_page=1" | fgrep "commit.author"
json[0].commit.author = {};
json[0].commit.author.date = "2016-07-02T10:51:21Z";
json[0].commit.author.email = "mail@tomnomnom.com";
json[0].commit.author.name = "Tom Hudson";
```

```
$ gron "https://api.github.com/repos/tomnomnom/gron/commits?per_page=1" | fgrep "commit.author" | gron --ungron
[
  {
    "commit": {
      "author": {
        "date": "2016-07-02T10:51:21Z",
        "email": "mail@tomnomnom.com",
        "name": "Tom Hudson"
      }
    }
  }
]
```

## [jl](https://github.com/chrisdone/jl)

Queries like jq but with a simplier syntax with less wild capabilities

## [fx](https://github.com/antonmedv/fx)

Uses the same query language as jl but in the Javascript ecosystem instead of Haskell

## Converters

### Ruby

Inside of a Makefile:

```make
%.json: %.yaml
	ruby -e 'require "yaml"; require "json"; puts JSON.pretty_generate(YAML.parse(STDIN.read).to_ruby)' < $< > $@
```

### [eat](https://github.com/antonmedv/eat)

Converts a variety of other formats into JSON
