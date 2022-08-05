function main() {
  RedBean.OnHttpRequest = () -> {
    RedBean.Write('Hello from redbean');
  };
  RedBean.LaunchBrowser();
}