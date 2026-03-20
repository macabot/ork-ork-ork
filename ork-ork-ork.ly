\version "2.24.3"

\header {
  title = "Ork ork ork"
  composer = "Michael Cabot & Anne Kerkhoven"
  tagline = "Ter gelegenheid van de 70e verjaardag van Guus."
}

verseOneChords = \chordmode {
  g1 c1 a1:m d1
  g1 c1 a1:m d1
  g1 c1 a1:m d1
  g1 c1 d1 r1
}

verseOneMelody = \relative c' {
  % Ensure the \tempo is written above the \sectionLabel
  \override Score.MetronomeMark.outside-staff-priority = #3000
  \override Score.SectionLabel.outside-staff-priority = #1000

  \section
  \sectionLabel "Couplet 1"
  % Voordat Guus een peuter was, kon
  g4 g4 g4 g'8 e8~ e8 c4 c4 r8 c4
  % hij al heel goed tellen.
  e4 e4 e4 e4 e8 d4. r2

  % Als je dan wat hulp nodig had,
  g,4 g4 g4 g'8 e8~
  e8 c8 c8 c4 r8 r4
  % kon je hem altijd bellen. Maar
  e8 e8 e4 e4 e4
  e8 d4 r8 r4 g,4

  % Guus was erg gewild. Je stond
  g4 g4 g4 g'8 e8~ e8 r8 r4 r4 c8 c8
  % erg lang in de wacht.
  e4 e4 e4 e8 d8~ d8 r8 r4 r2

  % Welk getal komt er na 6?
  g,4 g4 g4 g'8 e8~
  e8 c4 c4 r8 r4

  % Is dat soms 8?
  r4 fis8 g4 a4 a8~ a4_"(Nee, 7.)" r4 r2
}

verseOneLyrics = \lyricmode {
  Voor~ dat Guus een peu~ ter was, kon
  hij al heel goed tel~ len.
  Als je dan wat hulp no~ dig had,
  kon je hem al~ tijd bel~ len. Maar
  Guus was erg ge~ wild. Je stond
  erg lang in de wacht.

  Welk ge~ tal komt er na "6?"
  Is dat soms \markup \bold "8?"
}

verseTwoChords = \chordmode {
  d1
  g1 c1 a1:m d1
  g1 c1 a1:m d1
  g1 c1 a1:m d1
  g1 c1 d1 r1
}

verseTwoMelody = \relative c' {
  \section
  \sectionLabel "Couplet 2"
  % Toen
  r2 r4 g4
  % Guus later naar school ging, hielp hij
  g4 g4 g4 g'8 e8~
  e8 c4 r8 r4 c8 c8
  % elk kind met succes. Als de
  e4 e4 e4 e8 d8~
  d8 r8 r4 r4 g,8 g8

  % juf een keertje ziek was, gaf hij
  g4 g4 g4 g'8 e8~
  e8 c4 r8 r4 c8 c8
  % zelf gewoon de les.
  e4 e4 e4 e8 d8~
  d8 r8 r4 r2

  % Optellen bij het rekenen, deed
  g,4 g8 g8  g4  g'8 e8~ e8 c4 c4 r8 c4
  % Guus met veel plezier. De
  e4 e4 e4 e8 d8~
  d8 r8 r4 r4 r8 g,8

  % juf vroeg, wat is 3 + 3?
  g4 g4 g4 g'8 e8~ e8 c4 c4 r4 e8

  % De klas riep heel hard 4.
  fis4 fis8 g4 a4 a8~ a4_"(Nee, 6.)" r4 r2
}

verseTwoLyrics = \lyricmode {
  Toen Guus la~ ter naar school ging,
  hielp hij elk kind met suc~ ces.
  Als de juf een keer~ tje ziek was,
  gaf hij zelf ge~ woon de les.

  Op~ tel~ len bij het re~ ke~ nen,
  deed Guus met veel ple~ zier.
  De juf vroeg, wat is "3" "+" "3?"
  De klas riep heel hard \markup \bold "4."
}

verseThreeChords = \chordmode {
  d1
  g1 c1 a1:m d1
  g1 c1 a1:m d1
  g1 c1 a1:m d1
  g1 c1 d1 r1
}

verseThreeMelody = \relative c' {
  \section
  \sectionLabel "Couplet 3"
  % Toen
  r2 r4 g4
  % Guus alweer wat ouder was, deed
  g4 g4 g4 g'8 e8~
  e8 c4 c4 r8 c4
  % hij wiskunde examen. Hij
  e4 e4 e8 e8 e8 e8~
  e8 d4 r8 r4 g,4

  % was de beste van het land. Dat
  g4 g4 g4 g'8 e8~
  e8 c4 c4 r4 c8
  % kan ik wel beamen. De
  e4 e4 e4 e8 e8~
  e8 d4 r8 r4 r8 g,8

  % vragen waren te makkelijk. Je
  g4 g4 g8 g8 g'8 e8~
  e8 c4 c4 r8 c4
  % zag het aan zijn gelaat. De
  e8 e8 e4 e4 e8 d8~
  d8 r8 r4 r4 r8 g,8

  % omtrek van een cirkel, dat
  g4 g4 g4 g'8 e8~
  e8 c4 r8 r4 r8 e8

  % is Pi r-kwadraat.
  fis4 fis8 g4 a4 a8~ a4_"(Nee, 2 Pi r.)" r4 r2
}

% For debugging
% showLastLength = R1*5

verseThreeLyrics = \lyricmode {
  Toen Guus al~ weer wat ou~ der was,
  deed hij wis~ kun~ de ex~ a~ men.
  Hij was de bes~ te van het land.
  Dat kan ik wel be~ a~ men.

  De vra~ gen wa~ ren te mak~ ke~ lijk.
  Je zag het aan zijn ge~ laat.
  De om~ trek van een cir~ kel,
  dat is \markup \bold Pi \markup \bold r \markup \bold kwa~ \markup \bold draat.
}

chorusChords = \chordmode {
  g1 c1 a1:m r1
  g1 c1 a1:m d1
  g1 c1 a1:m d1
  g1 c1 d1 d1
}

chorusMelody = \relative c' {
  \section
  \sectionLabel "Refrein"

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
  g,4 g4 g4 g'4
  e2 r4 r8 c8
  % is ontzettend wijs. Maar na
  c4 c4 c8 c4. d2 r4 d8 d8

  % 70 jaar de slimste zijn, kleuren
  g,8 g8 g4 g4 g'8 e8~ e8 c4 c4 r8 e8 fis8~

  % zijn haren grijs.
  fis8 fis4 g4 a4 a8~ a2 r2
}

chorusLyrics = \lyricmode {
  Ork ork ork. Soep eet je met een \markup \bold vork.
  Ik had het kun~ nen we~ ten,
  maar was het toch ver~ ge~ ten.

  Guus weet gewoon heel veel. Hij
  is ont~ zet~ tend wijs. Maar na
  ze~ ven~ tig jaar de slim~ ste zijn, kleu~ ren
  zijn ha~ ren grijs.
}

chorusEndChords = \chordmode {
  g1 c1 a1:m r1
  g1 c1 a1:m d1
  g1 c1 a1:m d1
  g1 c1 d1 r2 g2
}

chorusEndMelody = \relative c' {
  \section
  \sectionLabel "Slotrefrein"
  
  \override TextSpanner.bound-details.left.text = \markup { \italic "rall." }

  % Ork ork ork,
  g2 g'4. e8~ e1
  % soep eet je met een
  c4 c8 c8 c8 c4.
  % vork                Ik
  d2_"(Nee, lepel.)" r4 d4

  % had het kunnen weten,
  g,4 g4 g4 g'8 e8~ e8 c4. r4
  % maar was het toch vergeten. De
  c4 c4 c4 c4 e8 d8~ d8 d4. r4 g,4

  % klok horen we wel luiden, maar
  g4 g8 g8 g8 g'4 e8~
  e8 c4 r2 c8
  % waar hangt toch die klepel? En
  e4 e4 e4 e8 e8~
  e8 d4 r2 g,8\startTextSpan

  % Guus die weet, zoals wij nu ook, soep
  g4 g4 g8 g8 g'8 e8~
  e8 c4 c4 r8 e8 fis8~

  % eet je met een
  fis8 fis4 g4 a8 r4\stopTextSpan\fermata

  % (lepel)
  r2_\markup { \bold \large "(Lepel!)" } \parenthesize g2
  \bar "|."
}

chorusEndLyrics = \lyricmode {
  Ork ork ork. Soep eet je met een \markup \bold vork.
  Ik had het kun~ nen we~ ten,
  maar was het toch ver~ ge~ ten. De

  klok ho~ ren we wel lui~ den,
  maar waar hangt toch die kle~ pel?
  En Guus die weet, zo~ als wij nu ook,
  soep eet je met een
}

% The Chords
theChords = \chordmode {
  \set chordChanges = ##t
  \verseOneChords
  \chorusChords
  \verseTwoChords
  \chorusChords
  \verseThreeChords
  \chorusEndChords
}

% The Melody
melody = \relative c' {
  \clef treble
  \key g \major
  \time 4/4
  \tempo "Speels" 4 = 150

  \verseOneMelody
  \chorusMelody
  \verseTwoMelody
  \chorusMelody
  \verseThreeMelody
  \chorusEndMelody
}

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
      \verseTwoLyrics
      \chorusLyrics
      \verseThreeLyrics
      \chorusEndLyrics
    }
  >>
  \layout { }
  \midi { }
}
