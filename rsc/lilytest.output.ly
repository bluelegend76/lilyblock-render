\score {
  <<
    %@c
    \chords {
      \set chordChanges = ##t
      a4:m  a:m
      a:m   a:m
    }
    %@m
    {
    \time 2/4
    \tempo 4=38
    \key a \minor
      e'8 a'      e' c'16 b
      a8 c'16 b   a4
    }
    %% %@b
    %% {
    %%   s2
    %%   a,4  a,
    %%   a,   a,
    %% }
    %% \drums {
    %%   ss4 ss
    %%   ss  ss
    %%   ss  ss
    %% }
  >>
  \layout { }
}

\score {
  <<
    %@c
  % \chords {
  %   s2          % in midi-version: insert blank bar
  %               %   for all instruments except the drums
  %   a4:m  a:m
  %   a:m   a:m
  % }
    %@m
    {
    \time 2/4
    \tempo 4=38
    \key a \minor
      s2
      e'8 a'      e' c'16 b
      a8 c'16 b   a4
    }
    %@b
    {
      s2
      a,4  a,
      a,   a,
    }
    \drums {
      ss4 ss
      ss  ss
      ss  ss
    }
  >>
  \midi { }
}

