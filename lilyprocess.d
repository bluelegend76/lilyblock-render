import std;

string[] chordLines;
string[] melodyLines;
string[] bassLines;

void handleLine(char c, string line) {
  switch(c) {
    case 'c':
      {
        /* writeln("This is chords."); */
        chordLines ~= line;
      }
    break;
    case 'm':
      {
        /* writeln("This is a melody."); */
        melodyLines ~= line;
      }
    break;
    case 'b':
      {
        /* writeln("This is a bass line."); */
        bassLines ~= line;
      }
    break;
    case 'd':
      {
        writeln("This is drums.");
        // TODO: Handle calculation of metronome part
        // drumLines ~= line;
      }
    break;
    default: writeln("Unknown character: ", c);
  }
}

int main(string[] args)
{
  assert(args.length == 2, "Needs one argument");
  string input = readText(args[1]);
  while (true) {
    long indexOfPercent = input.indexOf("%@");
    /* writeln("first % is at: ", indexOfPercent); */
    char c = input[indexOfPercent+2..indexOfPercent+3][0];
    if (indexOfPercent != -1) {
      // Remove marker (eg. %@m) + the following newline
      input = input[indexOfPercent+3+newline.length..$];
      auto nl = input.indexOf(newline);
      auto endOfBlockIndex = input.indexOf("%@-");
      if (endOfBlockIndex == -1) {
        stderr.writeln("'%@-' markers for end of note-blocks missing. Exiting program.");
        return 1;
      }
      auto block = input[0..endOfBlockIndex];
      foreach(l; block.splitLines()) {
        handleLine(c, l);
      }
      input = input[endOfBlockIndex+3..$];
    }
    else {
      break;
    }
  }
  writeln("\\chords {");
  foreach(l; chordLines) {
    writeln("  ", l);
  }
  writeln("}");

  writeln("{");
  foreach(l; melodyLines) {
    writeln("  ", l);
  }
  writeln("}");

  writeln("{");
  foreach(l; bassLines) {
    writeln("  ", l);
  }
  writeln("}");
  /* writeln(chordLines); */
  /* writeln(melodyLines); */
  /* writeln(bassLines); */

  return 0;
}
