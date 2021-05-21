self: super:

let
  inherit (super) callPackage;

  ## Updates Elixir in a given beam.packages version.
  updateElixir = erlang-self: erlang-super: rec {
    elixir_1_10 = self.beam.lib.callElixir ./elixir-1.10.nix {
      inherit (erlang-super) erlang rebar;
      debugInfo = true;
    };

    elixir = elixir_1_10;
  };
in

rec {
   ############################################################################
  ##                       Elixir 1.10 on NixOS 19.09                       ##
  ############################################################################

  beam = self.lib.recursiveUpdate super.beam rec {
    packages = {
      erlang = super.beam.packages.erlang.extend updateElixir;
      erlangR18 = super.beam.packages.erlangR18.extend updateElixir;
      erlangR19 = super.beam.packages.erlangR19.extend updateElixir;
      erlangR20 = super.beam.packages.erlangR20.extend updateElixir;
      erlangR21 = super.beam.packages.erlangR21.extend updateElixir;
      erlangR22 = super.beam.packages.erlangR22.extend updateElixir;
    };

    interpreters.elixir_1_10 = packages.erlang.elixir_1_10;
    interpreters.elixir = interpreters.elixir_1_10;
  };

  inherit (beam.interpreters) elixir_1_10;

}
