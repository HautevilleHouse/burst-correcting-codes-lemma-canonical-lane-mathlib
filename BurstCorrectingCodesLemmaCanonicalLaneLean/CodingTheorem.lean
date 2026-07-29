import BurstCorrectingCodesLemmaCanonicalLaneLean.InterleavingScheme

/-!
# Burst Correcting Codes Theorem Package
-/

namespace HautevilleHouse
namespace BurstCorrectingCodesLemmaCanonicalLaneLean

structure CodingTheorem {M : BurstErrorModel} {I : InterleavingScheme M} where
  codeConstruction : Type
  burstCorrectionCapacity : Prop
  redundancyBound : Prop
  theoremStatement : Prop

structure CodingTheoremEvidence {M : BurstErrorModel} {I : InterleavingScheme M}
    (T : CodingTheorem I) where
  burstCorrectionCapacityClosed : T.burstCorrectionCapacity
  redundancyBoundClosed : T.redundancyBound
  theoremStatementClosed : T.theoremStatement

def CodingTheoremClosed {M : BurstErrorModel} {I : InterleavingScheme M}
    (T : CodingTheorem I) : Prop :=
  T.burstCorrectionCapacity ∧ T.redundancyBound ∧ T.theoremStatement

theorem coding_theorem_closed_from_evidence {M : BurstErrorModel}
    {I : InterleavingScheme M} (T : CodingTheorem I)
    (E : CodingTheoremEvidence T) : CodingTheoremClosed T := by
  exact And.intro E.burstCorrectionCapacityClosed
    (And.intro E.redundancyBoundClosed E.theoremStatementClosed)

end BurstCorrectingCodesLemmaCanonicalLaneLean
end HautevilleHouse