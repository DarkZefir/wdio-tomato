@smoke
@mvl @vlcc @px
@ipa
@give_feedback
Feature: Give Feedback

  @CU-29757 @CU-32314 @CU-33153
  Scenario: Verify that appropriate overlay opens on clicking on "Give Feedback" button
    * I am logged in
    # Click "Feedback" button
    * I click "Header > Feedback Button"
    # Verify that "Feedback" popup is visible
    * "Feedback Popup" should be visible
    # Verify the following elements in "Feedback" popup
    * Text of "Feedback Popup > Popup Title" should be "FEEDBACK"
    * "Feedback Popup > Submit" should be visible
    * "Feedback Popup > Submit" should not be enabled
    * "Feedback Popup > Cancel" should be visible
    * "Feedback Popup > Cancel" should be enabled
    * "Feedback Popup > X Close Button" should be visible
    * "Feedback Popup > X Close Button" should be enabled
    * Text of "Feedback Popup > Label Topic" should be "Topic (REQUIRED)"
    * "Feedback Popup > Topic Input" should be visible
    * Text of "Feedback Popup > Label Message" should be "Message (REQUIRED)"
    * "Feedback Popup > Message Input" should be visible
    * Text of "Feedback Popup > Limit" should be "500 characters (max)"
    # Click "Cancel" button
    * I click "Feedback Popup > Cancel"
    # Verify that "Feedback" popup is no longer visible
    * "Feedback Popup" should not be visible
