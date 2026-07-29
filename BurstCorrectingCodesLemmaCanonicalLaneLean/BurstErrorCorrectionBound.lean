import HautevilleHouse.BurstCorrectingCodesLemmaCanonicalLaneLean.BurstErrorDetection
import Mathlib.Data.Nat.Basic

namespace HautevilleHouse
namespace BurstCorrectingCodesLemmaCanonicalLaneLean

structure BurstErrorCorrectionBoundPackage (D : BurstErrorDetectionPackage) where
  bound : Nat
  correctionInequality : ∀ c, bound ≤ D.maxCorrectableBurstLength

def BurstErrorCorrectionBoundClosed (B : BurstErrorCorrectionBoundPackage) : Prop :=
  B.correctionInequality

end BurstCorrectingCodesLemmaCanonicalLaneLean
end HautevilleHouse