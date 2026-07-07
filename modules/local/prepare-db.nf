process PREPARE_DB_MOD {

    input:
    tuple val(taxa), path(pp_db)

    output:
    path "0000000000.tar.gz"
    
    when:
    task.ext.when == null || task.ext.when

    script:
"""
set -euxo pipefail

echo "===== DEBUG ====="
pwd
ls -lah
echo
echo "PATH=\$PATH"
echo
which prepare-pp-db.sh || true
ls -l \$(dirname \$(which prepare-pp-db.sh 2>/dev/null)) || true
echo
echo "Input file:"
ls -lh ${pp_db}
echo

prepare-pp-db.sh ${pp_db}

echo
echo "Finished prepare-pp-db.sh"
ls -lah
"""
}

