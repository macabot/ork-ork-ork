\header {
  title = "Ork ork ork"
  composer = "Michael Cabot & Anne Kerkhoven"
  tagline = ""
}

% 1. Define the Chords
theChords = \chordmode {
  \set chordChanges = ##t
  \repeat unfold 2 {
    g1 | c1 | a1:m | d1
  }
}

% 2. Define the Melody
% Note: 'g4' is a quarter note G. 'r4' is a quarter rest.
melody = \relative c' {
  \clef treble
  \key c \major
  \time 4/4
  \tempo "Playfully" 4 = 150

  % Ork ork ork,
  g2 g'4. e8~ | e1
  % soep eet je met een
  c4 c8 c8 c8 c4. |
  % vork                Ik
  d2_"(Nee, lepel.)" r4 d4

  % had het kunnen weten,
  g,4 g4 g4 g'8 e8~ e8 c4. r4
  % maar was het toch vergeten.
  c4 c4 c4 c4 e8 d8~ d8 d4. r4
}

% 4. Put it all together
\score {
  <<
    \new ChordNames { \theChords }
    \new Staff { \melody }
    \addlyrics {
      Ork ork ork. Soep eet je met een vork.
      Ik had het kun~ nen we~ ten,
      maar was het toch ver~ ge~ ten.
    }
  >>
  \layout { }
  \midi { }
}
