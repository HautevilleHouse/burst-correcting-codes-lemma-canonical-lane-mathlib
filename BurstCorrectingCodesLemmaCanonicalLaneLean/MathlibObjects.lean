import BurstCorrectingCodesLemmaCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace BurstCorrectingCodesLemmaCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure BurstCodeSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure BurstCodeAdmittedObject where
  space : BurstCodeSpace
  finiteSet : Prop
  burstPattern : Prop
  syndromeModel : Type
  syndromeTopology : TopologicalSpace syndromeModel
  correctableSyndrome : Prop
  conclusion : correctableSyndrome

structure BurstCodeEndgameState where
  object : BurstCodeAdmittedObject

def BurstCodeWitnessClosed (O : BurstCodeAdmittedObject) : Prop :=
  O.correctableSyndrome

end BurstCorrectingCodesLemmaCanonicalLaneLean
end HautevilleHouse
