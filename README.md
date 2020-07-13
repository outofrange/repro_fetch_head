Conflicting bug description
===========================

I encountered a bug where `git` won't correctly set replace `FETCH_HEAD` but append to it, leading to duplicate entries and multiple pulls / merges.
This can mess up local branches quite badly and is a potential source for merge conflicts.


Our setup
=========

The bug seems to occur only in a very specific setup: using `git` in a Citrix Client on a mapped Client drive.
Apparently, Citrix fails to handle file replacements.


Reproduce
=========

Call `./repro.sh n` included in this repository.
This script will

- checkout this repository as a sibling (`n` being used as a postfix to avoid folder name collisions),
- checkout branch `b1` and call `git fetch` (containing a change to this `README.md` file)
- checkout branch `b2` and call `git fetch` (containing another, conflicting change to this `README.md` file)
- checkout `master` again
- call `git pull -v` on master, cating `.git/FETCH_HEAD` before and after

While pulling master shouldn't lead to conflicts in this case (even Git says so), `FETCH_HEAD` won't be replaced but appended, so `git` will try to pull all branches.

