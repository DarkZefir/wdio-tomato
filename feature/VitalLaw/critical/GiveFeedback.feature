@critical_path
@mvl
Feature: Give Feedback

  @CU-29791
  Scenario: Verify that user can send a feedback from "Feedback" overlay (User cancel Feedback sending)
    * I am logged in
    * I am on "TAX - INTERNATIONAL" PA
    * "Header > Feedback Button" should be visible
    * I click "Header > Feedback Button"
    * I type "QA test" in "Feedback Popup > Topic Input"
    * "Feedback Popup > Submit" should not be enabled
    * I type "Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo. Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum, quia dolor sit amet consectetur adipisci[ng] velit, sed quia non numquam [do]12" in "Feedback Popup > Message Input"
    * "Feedback Popup > Submit" should be enabled
    * I click "Feedback Popup > Cancel"
    * "Confirmation Popup" should be visible
    * I click "Confirmation Popup > Confirm Button"
    * "Feedback Popup" should not be visible

  @CU-29797
  Scenario: Verify that user can send a feedback from "Feedback" overlay
    * I am logged in
    * I am on "TAX - INTERNATIONAL" PA
    * "Header > Feedback Button" should be visible
    * I click "Header > Feedback Button"
    * I type "QA test" in "Feedback Popup > Topic Input"
    * "Feedback Popup > Submit" should not be enabled
    * I type "Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo. Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum, quia dolor sit amet consectetur adipisci[ng] velit, sed quia non numquam [do]12" in "Feedback Popup > Message Input"
    * "Feedback Popup > Submit" should be enabled
    * I click "Feedback Popup > Submit"
    * "Feedback Popup" should not be visible