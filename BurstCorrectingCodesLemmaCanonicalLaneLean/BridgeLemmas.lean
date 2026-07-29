import HautevilleHouse.BurstCorrectingCodesLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BurstCorrectingCodesLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  BurstWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end BurstCorrectingCodesLemmaCanonicalLaneLean
end HautevilleHouse
