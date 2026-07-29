import HautevilleHouse.BurstCorrectingCodesLemmaCanonicalLaneLean.BurstCyclicCodes
import HautevilleHouse.BurstCorrectingCodesLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BurstCorrectingCodesLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  BurstCodeWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  A.object.conclusion

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A :=
  A.gateWitness

def ConstrainedBurstCorrectingCodesClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem burst_correcting_codes_endgame (A : AdmissibleClass) : ConstrainedBurstCorrectingCodesClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BurstCorrectingCodesLemmaCanonicalLaneLean
end HautevilleHouse