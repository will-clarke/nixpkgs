{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "trivy";
  version = "0.13.0";

  src = fetchFromGitHub {
    owner = "aquasecurity";
    repo = pname;
    rev = "v${version}";
    sha256 = "0d9lb1wzvxywg88fy85bicixd8wipvbhnwfckwl3p8shh0s9sr22";
  };

  vendorSha256 = "0sashi3x3hccqm27dg6hjlvpgvx42jdxpgzigzm81md58zhk509x";

  subPackages = [ "cmd/trivy" ];

  buildFlagsArray = [
    "-ldflags="
    "-s"
    "-w"
    "-X main.version=v${version}"
  ];

  meta = with lib; {
    description = "A simple and comprehensive vulnerability scanner for containers, suitable for CI";
    longDescription = ''
      Trivy is a simple and comprehensive vulnerability scanner for containers
      and other artifacts. A software vulnerability is a glitch, flaw, or
      weakness present in the software or in an Operating System. Trivy detects
      vulnerabilities of OS packages (Alpine, RHEL, CentOS, etc.) and
      application dependencies (Bundler, Composer, npm, yarn, etc.).
    '';
    homepage = src.meta.homepage;
    license = licenses.asl20;
    maintainers = with maintainers; [ jk ];
  };
}
