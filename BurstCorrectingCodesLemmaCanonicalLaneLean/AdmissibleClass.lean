import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BurstCorrectingCodesLemmaCanonicalLaneLean

structure BurstAdmittedObject where
  code : Type
  burstLength : ℕ
  errorModel : Prop
  conclusion : errorModel

def BurstWitnessClosed (O : BurstAdmittedObject) : Prop :=
  O.errorModel

end BurstCorrectingCodesLemmaCanonicalLaneLean
end HautevilleHouse
