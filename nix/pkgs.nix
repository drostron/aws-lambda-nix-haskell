import (fetchTarball {
  # Descriptive name to make the store path easier to identify
  name = "nixos-20_03-2020-04-11";

  # Commit hash for nixos-20.03 as of 2020-04-11
  url = "https://github.com/nixos/nixpkgs/archive/1e90c46c2d98f9391df79954a74d14f263cad729.tar.gz";

  # Hash obtained using `nix-prefetch-url --unpack <url>`
  sha256 = "1gqv2m7plkladd3va664xyqb962pqs4pizzibvkm1nh0f4rfpxvy";
}) {}
