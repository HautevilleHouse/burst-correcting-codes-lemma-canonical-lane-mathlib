import canonicalLaneMathlib.AdmissibleClass
import BurstCorrectingCodesLemmaCanonicalLaneLean.BurstCodesAdmissibleClass

namespace HautevilleHouse
namespace BurstCorrectingCodesLemmaCanonicalLaneLean

structure BurstDecodingPackage where
  decodingAlgorithm : Type
  errorLocatorPolynomial : Type
  decodingSuccess : Prop
  decodingComplexity : Prop

structure BurstDecodingEvidence (D : BurstDecodingPackage) where
  decodingSuccessClosed : D.decodingSuccess
  decodingComplexityClosed : D.decodingComplexity

def BurstDecodingClosed (D : BurstDecodingPackage) : Prop :=
  D.decodingSuccess ∧ D.decodingComplexity

theorem burst_decoding_closed_from_evidence
    (D : BurstDecodingPackage) (Ev : BurstDecodingEvidence D) : BurstDecodingClosed D := by
  exact And.intro Ev.decodingSuccessClosed Ev.decodingComplexityClosed

end BurstCorrectingCodesLemmaCanonicalLaneLean
end HautevilleHouse