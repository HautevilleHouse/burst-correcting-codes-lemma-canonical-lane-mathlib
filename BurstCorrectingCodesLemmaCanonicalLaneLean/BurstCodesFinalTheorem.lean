import canonicalLaneMathlib.AdmissibleClass
import BurstCorrectingCodesLemmaCanonicalLaneLean.BurstCodesBridgeLemmas

namespace HautevilleHouse
namespace BurstCorrectingCodesLemmaCanonicalLaneLean

def ConstrainedBurstCodesClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_burst_codes_endgame (A : AdmissibleClass) :
    ConstrainedBurstCodesClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BurstCorrectingCodesLemmaCanonicalLaneLean
end HautevilleHouse