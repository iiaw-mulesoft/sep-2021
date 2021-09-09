%dw 2.0
import * from dw::util::Values
import * from dw::core::Strings
output application/json
fun lastNameMask(lastName) = lastName[0] ++ "***"
fun phoneMask(x) =  "(###)-###-" ++ x[-4 to -1]
fun emailMask(email) = "***@" ++ substringAfterLast(email, "@")
type Currency = String{format: "\$#,###.00"}

---
payload mask field("firstName") with upper($)
        mask field("lastName") with lastNameMask($)
        mask field("salary") with $ as Currency
        mask field("phone") with phoneMask($)
        mask field("email") with emailMask($)