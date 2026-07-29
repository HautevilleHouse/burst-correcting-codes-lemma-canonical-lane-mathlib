import HautevilleHouse.BurstCorrectingCodesLemmaCanonicalLaneLean.BurstErrorModel

namespace HautevilleHouse
namespace BurstCorrectingCodesLemmaCanonicalLaneLean

structure BurstCorrectionBounds {M : BurstErrorModel} where
  codeLength : Nat
  dimension : Nat
  burstCorrectionCapacity : Nat
  singletonBoundSatisfied : Prop
  reigerBoundSatisfied : Prop

structure BurstCorrectionBoundsEvidence {M : BurstErrorModel} (B : BurstCorrectionBounds) where
  codeLengthPositive : B.codeLength ≥ 1
  dimensionNonnegative : B.dimension ≥ 0
  burstCorrectionCapacityPositive : B.burstCorrectionCapacity ≥ 1
  singletonBoundClosed : B.singletonBoundSatisfied
  reigerBoundClosed : B.reigerBoundSatisfied

def BurstCorrectionBoundsClosed {M : BurstErrorModel} (B : BurstCorrectionBounds) : Prop :=
  B.codeLength ≥ 1 ∧ B.dimension ≥ 0 ∧ B.burstCorrectionCapacity ≥ 1 ∧ B.singletonBoundSatisfied ∧ B.reigerBoundSatisfied

theorem burst_correction_bounds_closed_from_evidence {M : BurstErrorModel} (B : BurstCorrectionBounds) (E : BurstCorrectionBoundsEvidence B) : BurstCorrectionBoundsClosed B :=
  And.intro E.codeLengthPositive (And.intro E.dimensionNonnegative (And.intro E.burstCorrectionCapacityPositive (And.intro E.singletonBoundClosed E.reigerBoundClosed)))

end BurstCorrectingCodesLemmaCanonicalLaneLean
end HautevilleHouse