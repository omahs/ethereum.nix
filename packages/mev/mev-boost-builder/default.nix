{
  blst,
  buildGoModule,
  fetchFromGitHub,
}:
buildGoModule rec {
  pname = "builder";
  version = "1.13.2.4844.dev5+6e6c723";

  src = fetchFromGitHub {
    owner = "flashbots";
    repo = "${pname}";
    rev = "v${version}";
    hash = "sha256-h9sRKFtM93knB4DJjQIhRzkbF3FWnmyEyu34QMw2gLE=";
  };

  vendorHash = "sha256-Dhcf7qF2PMzesqcDdnnmnZGto4T6+pq6CEeHy5sRvbk=";

  buildInputs = [blst];

  subPackages = ["cmd/geth"];

  ldflags = ["-s" "-w"];

  meta = {
    description = "Flashbots mev-boost block builder";
    homepage = "https://github.com/flashbots/builder";
    mainProgram = "geth";
    platforms = ["x86_64-linux"];
  };
}
