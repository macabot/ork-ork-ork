\header {
  title = "Ork ork ork"
  composer = "Michael Cabot & Anne Kerkhoven"
  tagline = ""
}

verseChords = \chordmode {
  g1 c1 a1:m d1
}

verseMelody = \relative c' {
  % Voordat Guus een peuter was, kon
  g4 g4 g4 g'8 e8~ e8 c4 c4 r8 c4
  % hij al heel goed tellen.
  e4 e4 e4 e4 e8 d4. r2
}

verseOneLyrics = \lyricmode {
  Voor~ dat Guus een peu~ ter was, kon
  hij al heel goed tel~ len.
}

chorusChords = \chordmode {
  g1 c1 a1:m r1
  g1 c1 a1:m d1
  g1 c1 a1:m d1
  g1 c1 d1 d1
}

chorusMelody = \relative c' {
  % Ork ork ork,
  g2 g'4. e8~ e1
  % soep eet je met een
  c4 c8 c8 c8 c4.
  % vork                Ik
  d2_"(Nee, lepel.)" r4 d4

  % had het kunnen weten,
  g,4 g4 g4 g'8 e8~ e8 c4. r4
  % maar was het toch vergeten.
  c4 c4 c4 c4 e8 d8~ d8 d4. r2

  % Guus weet gewoon heel veel. Hij
  g,4 g4 g4 g'4 e2 r4. c8
  % is ontzettend wijs. Maar na
  c4 c4 c8 c4. d2 r4 d8 d8

  % 70 jaar de slimste zijn, kleuren
  g,8 g8 g4 g4 g'8 e8~ e8 c4 c4 r8 e8 fis8~

  % zijn haren grijs.
  fis8 fis4 g4 a4 a8~ a2 r2
}

chorusLyrics = \lyricmode {
  Ork ork ork. Soep eet je met een vork.
  Ik had het kun~ nen we~ ten,
  maar was het toch ver~ ge~ ten.

  Guus weet gewoon heel veel. Hij
  is ont~ zet~ tend wijs. Maar na
  ze~ ven~ tig jaar de slim~ ste zijn, kleu~ ren
  zijn ha~ ren grijs.
}

% The Chords
theChords = \chordmode {
  \set chordChanges = ##t
  \verseChords
  \chorusChords
}

% The Melody
melody = \relative c' {
  \clef treble
  \key g \major
  \time 4/4
  \tempo "Playfully" 4 = 150

  \verseMelody
  \chorusMelody
}

% For debugging
% showLastLength = R1*3

% Put it all together
\score {
  <<
    \new ChordNames {
      \theChords
    }
    \new Staff {
      \new Voice = "myNotes" {
        \melody
      }
    }
    \new Lyrics \lyricsto "myNotes" {
      \verseOneLyrics
      \chorusLyrics
    }
  >>
  \layout { }
  \midi { }
}
