## Space fuel/ox

### Fuel[T3]

```mermaid
---
config:
    flowchart:
        defaultRenderer: elk
---
graph LR
    IceAs[/Ice Asteroid\] --> AmSo(Ammoniacal solution) --> Ice(Ice) & Am(Ammonia)
    Ice --> Wa(Water)
    CaAs[/Carbon Asteroid\] --> Ca(Carbon)
    Ca & Am & Wa --> Oil(Crude oil) --> Fuel[Thruster fuel]

    IceAs --> Ice
    IceAs --> Cal(Calcite) --> Fuel
```

### Oxidiser[T3] (From Ammonia - Dinitrogen Tetroxide (N₂O₄))

```mermaid
---
config:
    flowchart:
        defaultRenderer: elk
---
graph LR
    IceAs[/Ice Asteroid\] --> AmSo(Ammoniacal solution) --> Am(Ammonia)

    IceAs --> Cal(Calcite)
    Cal & Am --> Ox[Thruster Oxidiser]


    MetAs[/Metallic Asteroid\] --> Io(Iron ore) --> Ox
```

### Oxidiser[T4] (From fluorine - Dioxygen Difluoride (O₂F₂))

```mermaid
---
config:
    flowchart:
        defaultRenderer: elk
---
graph LR
    IceAs[/Ice Asteroid\] --> Ice(Ice) --> Wa(Water) --> Ox[Thruster Oxidiser]

    Fl[/Fluorine\] --> Ox
    IceAs --> Cal(Calcite) --> Ox
```

### Oxidiser[T5] (From sulfuric acid - Nitric Acid)

```mermaid
---
config:
    flowchart:
        defaultRenderer: elk
---
graph LR
    IceAs[/Ice Asteroid\] --> AmSo(Ammoniacal solution) --> Ice(Ice) & Am(Ammonia)
    Ice --> Wa(Water) --> Sa
    MetAs[/Metallic Asteroid\] --> Io(Iron ore) --> Ip(Iron plate)
    Ip --> Sa(Sulfuric acid) --> Ox

    CaAs[/Carbonic Asteroid\] --> Su(Sulfur) --> Sa
    Am --> Ox[Thruster Oxidiser]
``` 
