bran() {
  echo "Current: " $(git branch | grep '^\\*' | cut -d' ' -f2 | tr -d '\n')

  # Check if a pattern was provided
  if [ -n "$1" ]; then
      branches=$(git branch | grep "$1" | sed -e 's/^..//')
  else
      branches=$(git branch | sed -e 's/^..//')
  fi

  branch_count=$(echo "$branches" | wc -l)

  # If only one branch is found, check it out
  if [ "$branch_count" -eq 1 ]; then
      branch=$(echo "$branches" | head -n 1)
      echo "Checking out branch: $branch"
      git checkout "$branch"
  else
      # Otherwise, pass the branches to fzf for selection
      echo "Select a branch:"
      branch=$(echo "$branches" | fzf)
      if [ -n "$branch" ]; then
          echo "Checking out branch: $branch"
          git checkout "$branch"
      else
          echo "No branch selected."
      fi
  fi
}
