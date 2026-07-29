import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BurstCorrectingCodesLemmaCanonicalLaneLean

structure BurstErrorModel where
  burstLength : Nat
  errorPattern : Type
  detectionGuarantee : Prop
  correctionGuarantee : Prop

structure BurstAdmittedObject where
  burstModel : BurstErrorModel
  cyclicCode : Type
  generatorPolynomial : Type
  codespace : Prop
  conclusion : codespace

def BurstWitnessClosed (O : BurstAdmittedObject) : Prop :=
  O.codespace

structure AdmissibleClass where
  object : BurstAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  BurstWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BurstCorrectingCodesLemmaCanonicalLaneLean
end HautevilleHouse