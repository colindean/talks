## Enums notes

Back in the day, we used sigils: variables set to a constant, usually an small integer and named under a convention that made sense in context. Different sets of sigils reused the same integers, which was safe as long as the sigils' context and naming never collided.

```C
int red = 1;
int blue = 2;

void change_color(ColorInt color) {
  …
}

change_color(red);
change_color(blue);

int port = 8080;
int secret_code = 0x3425deadb33f;

change_color(port); // VALID!
change_color(secret_code); // VALID!
```

OOP could handle a type-checked way of establishing a hierarchy through inheritance.

```python
class ColorInt:
  def as_int() -> int:

class Red(ColorInt):
  def init():
    self.int = 2
 …
class Blue(ColorInt):
  def init():
    self.int = 2

def change_color(color: ColorInt):
  hex = lookup_hex_code(color)
  change_button_color(hex)
```

What we really want is an easy way of saying:

> Give me a set of symbols the value of which doesn't matter but that I can limit usage to any of the set of symbols.

This establishes a type-check with known bounds but the programmer doesn't really have to care about the underlying type used at runtime, if any at all.

Some langauges built in enums it in from the get-go.

```java
enum Color {
  Red;
  Blue;
}
int portNum = 8080;

function changeColor(Color color){…}

changeColor(Color.RED); // YEP
changeColor(portNum);  // NOPE
```

In Python, enums are provided by the `enum` library.

```python

from enum import Enum
class Color(Enum):
  RED = 0xff0000  # manually assign a value
  BLUE = 0x00ff00

class ModelMode(Enum):
  MULTI_LABEL = auto() # automatically assign a value
  MULTI_CLASS = auto()

def switch_mode(mode: str) -> None:
    pass

switch_mode("multi_label")
switch_mode("multi_lbl")

switch_mode(ModelMode.MULTI_LABEL)
```

Handling enums in Python used to be tedious, but with structural pattern matching added in Python 3.10, it's a cinch:

```python
def switch_mode(mode: ModelMode):
  # Python 3.9-
  if mode is ModelMode.MULTI_LABEL:
    …
  elsif mode is ModelMode.MULTI_CLASS:
   …

  # Python 3.10+

  match mode:
    case [ModelMode.MULTI_LABEL]:
        …
    case [ModelMode.MULTI_CLASS]:
        …
    case _:
        raise "Oh noes"
```

Some languages discourage enums, like Scala 2, which prefers case objects and case classes.

```scala
trait Color
case object Red extends Color
case object Blue extends Color
```

But [Scala 3 added them](https://docs.scala-lang.org/scala3/reference/enums/enums.html):

```scala
enum Color:
  case Red, Green, Blue

enum Color(val rgb: Int):
  case Red   extends Color(0xFF0000)
  case Green extends Color(0x00FF00)
  case Blue  extends Color(0x0000FF)
```


## Key takeaway

**Make illegal states unrepresentable**

**Make illegal arguments unpassable**

and define the bounds of your known expectations at runtime.
