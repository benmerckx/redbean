import RedBean.*;

function main() {
  trace('Init');
  OnHttpRequest = () -> {
    Write('Hello from redbean');
  }
  OnServerStart = () -> {
    trace('Server started');
  }
}