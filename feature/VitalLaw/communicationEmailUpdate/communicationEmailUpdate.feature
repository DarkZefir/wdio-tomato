@email_update
@mvl
Feature: Communication Email Update

  @logout
  @stg_only
  Scenario Outline: Communication Email Update for stg users
    * I am logged in as "<userName>" with "<password>" password
    * I set communication email to "cch.cheetah.qa@gmail.com"
    * I wait 5 seconds

    Examples:
      | userName                               | password   |
      | CheetahAuto1@e2e.com                   | CheetahE2E |
      | CheetahAuto2@e2e.com                   | CheetahE2E |
      | CheetahAuto3@e2e.com                   | CheetahE2E |
      | CheetahAuto4@e2e.com                   | CheetahE2E |
      | AutoUser1@wolterskluwer.com            | password   |
      | atuser02@chdvl.com                     | password   |
      | atuser03@chdvl.com                     | password   |
      | atuser04@chdvl.com                     | password   |
      | atuser05@chdvl.com                     | password   |
      | atuser06@chdvl.com                     | password   |
      | umadevi.periyakulang@wolterskluwer.com | password   |
      | veranika.klimko@wolterskluwer.com      | password   |
      | Elina.Chesnovskaya@wolterskluwer.com   | password   |
      | Irina.Alekseeva@wolterskluwer.com      | password   |
      | atuser07@chdvl.com                     | password   |
      | atuser08@chdvl.com                     | password   |
      | atuser09@chdvl.com                     | password   |
      | atuser10@chdvl.com                     | password   |
      | atuser11@chdvl.com                     | password   |
      | atuser12@chdvl.com                     | password   |
      | atuser13@chdvl.com                     | password   |
      | atuser14@chdvl.com                     | password   |
      | atuser15@chdvl.com                     | password   |
      | atuser16@chdvl.com                     | password   |
      | atuser17@chdvl.com                     | password   |
      | atuser18@chdvl.com                     | password   |
      | atuser19@chdvl.com                     | password   |
      | atuser20@chdvl.com                     | password   |
      | atuser21@chdvl.com                     | password   |
      | atuser22@chdvl.com                     | password   |
      | onePaUser@wk.com                       | password   |
      | kitlonly@wk.com                        | password   |
      | interlimit@wk.com                      | password   |
      | tag1@wk.com                            | password   |
      | alerts@wk.com                          | password   |
      | folderstest@wk.com                     | password   |
      | TLPmixed@wk.com                        | password   |
      | hrkclimit@wk.com                       | password   |
      | 2london@wk.com                         | password   |
      | OPSC4@wk.com                           | password   |
      | cht.rbs.filings@wk.com                 | password   |
      | Cheetonly@wk.com                       | password   |
      | cht.rbs.only1@wk.com                   | password   |
      | TMNWithoutCaseDB@wk.com                | password   |
      | tmnwithoutfct@wk.com                   | password   |
      | tmnwithoutttab@wk.com                  | password   |
      | TLPuser@wk.com                         | password   |
      | govercontract@wk.com                   | password   |
      | alertstesting1@wk.com                  | password   |
      | tag1@wk.com                            | password   |
      | taglimi@wk.com                         | password   |
      | TLPmixed@wk.com                        | password   |
      | TLPseveralstates@wk.com                | password   |
      | tlpfedliq@wk.com                       | password   |
      | LimitedKITL1@wk.com                    | password   |
      | LimitedKITL2@wk.com                    | password   |
      | UnavailableItemsTesting@wk.com         | password   |
      | Irina.Alekseeva@wolterskluwer.com      | password   |
      | tlpfedlrusliq@wk.com                   | password   |
      | tlpfedlrus@wk.com                      | password   |
      | gcnnotcustom@wk.com                    | password   |

  @logout
  @prod_only
  Scenario Outline: Communication Email Update for stg users
    * I am logged in as "<userName>" with "<password>" password
    * I set communication email to "cch.cheetah.qa@gmail.com"
    * I wait 5 seconds

    Examples:
      | userName                          | password |
      | onePaUser@wk.com                  | password |
      | prdautouser1t1@wk.com             | password |
      | prdautouser2t1@wk.com             | password |
      | prdautouser3t1@wk.com             | password |
      | prdautouser4t1@wk.com             | password |
      | prdautouser1t2@wk.com             | password |
      | prdautouser2t2@wk.com             | password |
      | prdautouser3t2@wk.com             | password |
      | prdautouser4t2@wk.com             | password |
      | kitlonly@wk.com                   | password |
      | interlimit@wk.com                 | password |
      | tag1@wk.com                       | password |
      | alerts@wk.com                     | password |
      | folderstest@wk.com                | password |
      | TLPmixed@wk.com                   | password |
      | hrkclimit@wk.com                  | password |
      | 2london@wk.com                    | password |
      | OPSC4@wk.com                      | password |
      | cht.rbs.filings@wk.com            | password |
      | Cheetonly@wk.com                  | password |
      | cht.rbs.only1@wk.com              | password |
      | TMNWithoutCaseDB@wk.com           | password |
      | tmnwithoutfct@wk.com              | password |
      | tmnwithoutttab@wk.com             | password |
      | TLPuser@wk.com                    | password |
      | govercontract@wk.com              | password |
      | alertstesting1@wk.com             | password |
      | tag1@wk.com                       | password |
      | taglimi@wk.com                    | password |
      | TLPmixed@wk.com                   | password |
      | TLPseveralstates@wk.com           | password |
      | tlpfedliq@wk.com                  | password |
      | LimitedKITL1@wk.com               | password |
      | LimitedKITL2@wk.com               | password |
      | UnavailableItemsTesting@wk.com    | password |
      | Irina.Alekseeva@wolterskluwer.com | password |
      | tlpfedlrusliq@wk.com              | password |
      | tlpfedlrus@wk.com                 | password |
      | gcnnotcustom@wk.com               | password |
      | atuser01@chdvl.com                | password |
