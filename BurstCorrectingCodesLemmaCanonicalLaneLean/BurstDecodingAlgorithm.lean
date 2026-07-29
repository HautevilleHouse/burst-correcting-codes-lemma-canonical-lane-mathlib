import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BurstCorrectingCodesLemmaCanonicalLaneLean

structure BurstDecodingAlgorithm where
  codeLength : Nat
  parityCheckMatrix : List (List Bool)
  syndromeComputation : List Bool → List Bool
  errorCorrection : List Bool → List Bool → List Bool
  codeLengthPos : codeLength > 0
  parityCheckValid : ∀ row, row.length = codeLength
  syndromeConsistent : ∀ x, syndromeComputation x = (map (fun r => foldr xor false (zipWith and r x)) parityCheckMatrix)
  correctionConsistent : ∀ x y, errorCorrection x y = map2 (fun a b => a xor b) x y

structure BurstDecodingEvidence (D : BurstDecodingAlgorithm) where
  codeLengthPosClosed : D.codeLengthPos
  parityCheckValidClosed : D.parityCheckValid
  syndromeConsistentClosed : D.syndromeConsistent
  correctionConsistentClosed : D.correctionConsistent

def BurstDecodingClosed (D : BurstDecodingAlgorithm) : Prop :=
  D.codeLengthPos ∧ D.parityCheckValid ∧ D.syndromeConsistent ∧ D.correctionConsistent

theorem burst_decoding_closed_from_evidence (D : BurstDecodingAlgorithm) (E : BurstDecodingEvidence D) : BurstDecodingClosed D := by
  exact And.intro E.codeLengthPosClosed
    (And.intro E.parityCheckValidClosed
      (And.intro E.syndromeConsistentClosed E.correctionConsistentClosed))

end BurstCorrectingCodesLemmaCanonicalLaneLean
end HautevilleHouse