import HautevilleHouse.BurstCorrectingCodesLemmaCanonicalLaneLean.AdmissibleClass
import Mathlib.Data.Set.Basic

namespace HautevilleHouse
namespace BurstCorrectingCodesLemmaCanonicalLaneLean

structure BurstErrorDetectionPackage where
  encoding : List Bool -> List Bool
  decoding : List Bool -> List Bool
  maxCorrectableBurstLength : Nat
  detectionCapability : ∀ c, encoding c | burstErrors maxCorrectableBurstLength

def BurstErrorDetectionClosed (P : BurstErrorDetectionPackage) : Prop :=
  P.detectionCapability

end BurstCorrectingCodesLemmaCanonicalLaneLean
end HautevilleHouse