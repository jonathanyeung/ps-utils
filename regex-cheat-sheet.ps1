$pattern = '\d{1,5}'
$testString = "Hello World. 12345.  This is a test!"

$matches = [Regex]::Matches($testString, $pattern)

foreach($match in $matches)
{
    Write-Host $match.Value
}

Write-Host '
| Basic Characters
-------------------------------------------------------------------------------'

Write-Host 
'\d | One Digit from 0 to 9
[Regex]::Match("a1bc", "\d") -> ' + [Regex]::Match("a1bc", "\d")

Write-Host 
'\D | Any non-digit 0-9
[Regex]::Match("1ab", "\D") -> ' + [Regex]::Match("1ab", "\D")

Write-Host
'\w | One "Word Character" including digits
[Regex]::Match("a1?b", "\w\w") -> ' + [Regex]::Match("a1?b", "\w\w")

Write-Host
'\W | One non-word Character (opposite set of \w)
[Regex]::Match("a1?b", "\W") -> ' + [Regex]::Match("a1?b", "\W")

Write-Host
'\s | One whitespace character
[Regex]::Match("a b", "a\sb") -> ' + [Regex]::Match("a b", "a\sb")

Write-Host
'\S | One non-whitespace character
[Regex]::Match(" a b", "\S\s\S") -> ' + [Regex]::Match(" a b", "\S\s\S")

Write-Host
'. | Any character except line break
[Regex]::Match("abc", "a.c") -> ' + [Regex]::Match("abc", "a.c")

Write-Host
'\ | Escape character
[Regex]::Match(".*+?", "\.\*\+\?") -> ' + [Regex]::Match(".*+?", "\.\*\+\?")

Write-Host '
| Quantifiers
-------------------------------------------------------------------------------'

Write-Host
'+ | One or more
[Regex]::Match("abbbc", "a+b+") -> ' + [Regex]::Match("abbbc", "a+b+")

Write-Host
'* | Zero or more
[Regex]::Match("abbbc", "b*") -> ' + [Regex]::Match("abbbc", "b*")

Write-Host
'? | Zero or One
[Regex]::Match("abc", "ab?cd?") -> ' + [Regex]::Match("abc", "ab?cd?")

Write-Host
'{n} | Exactly n times
[Regex]::Match("abbbc", "b{2}") -> ' + [Regex]::Match("abbbc", "b{2}")

Write-Host
'{n,m} | n to m times, inclusive
[Regex]::Match("aaabbbc", "a{1}b{2,3}") -> ' + [Regex]::Match("aaabbbc", "a{1}b{2,3}")

Write-Host
'{n,} | n or more times
[Regex]::Match("aaaaa", "a{1,}") -> ' + [Regex]::Match("aaaaa", "a{1,}")

Write-Host
'+? | Changes + operator to "lazy" mode
[Regex]::Match("aaaaa", "a+?") -> ' + [Regex]::Match("aaaaa", "a+?")

Write-Host '
Logic
-------------------------------------------------------------------------------'

Write-Host
'| | OR operand
[Regex]::Match("233", "22|33") -> ' + [Regex]::Match("233", "22|33")

Write-Host
'(...) | Capturing Group
[Regex]::Match("Apple", "A(nt|pple)") -> ' + [Regex]::Match("Apple", "A(nt|pple)")

Write-Host
'\n | Contents of group n
[Regex]::Match("JEWEL ABBA", "J(\w)W\1L (.)BB\2") -> ' + [Regex]::Match("JEWEL ABBA", "J(\w)W\1L (.)BB\2")

Write-Host
'(?: ...) | Non-capturing Group
[Regex]::Match("Apple Banana", "A(?:pple)\sB(\w{2})\1a") -> ' + [Regex]::Match("Apple Banana", "A(?:pple)\sB(\w{2})\1a")

Write-Host 'Full documentation found here: https://www.rexegg.com/regex-quickstart.html'