import HautevilleHouse.BurstCorrectingCodesLemmaCanonicalLaneLean.BurstInterleaving

namespace HautevilleHouse
namespace BurstCorrectingCodesLemmaCanonicalLaneLean

structure BurstCyclicCode {M : BurstErrorModel} {B : BurstCorrectionBounds M} {I : BurstInterleaving M B} where
  generatorPolynomial : Polynomial ℤ
  codeLengthDivisible : I.interleavedCodeLength % 2 = 0
  burstErrorDetectionCapability : Prop
  syndromeDecodingEfficient : Prop

structure BurstCyclicCodeEvidence {M : BurstErrorModel} {B : BurstCorrectionBounds M} {I : BurstInterleaving M B} (C : BurstCyclicCode) where
  generatorPolynomialIrreducible : Irreducible C.generatorPolynomial
  codeLengthDivisibleClosed : C.codeLengthDivisible
  burstErrorDetectionCapabilityClosed : C.burstErrorDetectionCapability
  syndromeDecodingEfficientClosed : C.syndromeDecodingEfficient

def BurstCyclicCodeClosed {M : BurstErrorModel} {B : BurstCorrectionBounds M} {I : BurstInterleaving M B} (C : BurstCyclicCode) : Prop :=
  Irreducible C.generatorPolynomial ∧ C.codeLengthDivisible ∧ C.burstErrorDetectionCapability ∧ C.syndromeDecodingEfficient

theorem burst_cyclic_code_closed_from_evidence {M : BurstErrorModel} {B : BurstCorrectionBounds M} {I : BurstInterleaving M B} (C : BurstCyclicCode) (E : BurstCyclicCodeEvidence C) : BurstCyclicCodeClosed C :=
  And.intro E.generatorPolynomialIrreducible (And.intro E.codeLengthDivisibleClosed (And.intro E.burstErrorDetectionCapabilityClosed E.syndromeDecodingEfficientClosed))

end BurstCorrectingCodesLemmaCanonicalLaneLean
end HautevilleHouse