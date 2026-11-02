
lignes_modifiees=$(gh pr view "$PR_NUMBER" --json additions,deletions | jq -r '.additions + .deletions')

if [ "$lignes_modifiees" -gt 1000 ]; then
  echo "Le nombre de lignes modifiées est supérieur à 1000."
  gh pr edit "$PR_NUMBER" --add-label "bigdiff"

else
  echo "Le nombre de lignes modifiées est inférieur ou égal à 1000."
  if gh pr view "$PR_NUMBER" --json labels | jq -e '.labels | map(.name) | index("bigdiff")' > /dev/null; then
    echo "Le label 'bigdiff' est présent. Suppression du label."
    gh pr edit "$PR_NUMBER" --remove-label "bigdiff"
  else
    echo "Le label 'bigdiff' n'est pas présent. Aucune action nécessaire."
  fi
fi
