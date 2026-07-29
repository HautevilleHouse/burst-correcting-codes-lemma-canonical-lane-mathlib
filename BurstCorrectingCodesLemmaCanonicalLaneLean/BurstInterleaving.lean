import HautevilleHouse.BurstCorrectingCodesLemmaCanonicalLaneLean.BurstCorrectionBounds

namespace HautevilleHouse
namespace BurstCorrectingCodesLemmaCanonicalLaneLean

structure BurstInterleaving {M : BurstErrorModel} {B : BurstCorrectionBounds M} where
  interleavingDepth : Nat
  interleavedCodeLength : Nat
  burstErrorDispersion : Prop
  errorCorrectionPreserved : Prop

structure BurstInterleavingEvidence {M : BurstErrorModel} {B : BurstCorrectionBounds M} (I : BurstInterleaving) where
  interleavingDepthPositive : I.interleavingDepth ≥ 1
  interleavedCodeLengthPositive : I.interleavedCodeLength ≥ 1
  burstErrorDispersionClosed : I.burstErrorDispersion
  errorCorrectionPreservedClosed : I.errorCorrectionPreserved

def BurstInterleavingClosed {M : BurstErrorModel} {B : BurstCorrectionBounds M} (I : BurstInterleaving) : Prop :=
  I.interleavingDepth ≥ 1 ∧ I.interleavedCodeLength ≥ 1 ∧ I.burstErrorDispersion ∧ I.errorCorrectionPreserved

theorem burst_interleaving_closed_from_evidence {M : BurstErrorModel} {B : BurstCorrectionBounds M} (I : BurstInterleaving) (E : BurstInterleavingEvidence I) : BurstInterleavingClosed I :=
  And.intro E.interleavingDepthPositive (And.intro E.interleavedCodeLengthPositive (And.intro E.burstErrorDispersionClosed E.errorCorrectionPreservedClosed))

end BurstCorrectingCodesLemmaCanonicalLaneLean
end HautevilleHouse