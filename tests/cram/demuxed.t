  $ IN="$TESTDIR"/data/demultiplex.bc1009--bc1009.consensusreadset.xml
  $ REF="$TESTDIR"/data/demultiplex.bc1009--bc1009.ref.fasta
  $ SAMTOOLS_VERSION=$("$SAMTOOLS" --version | head -n 1 | cut -d '.' -f 2)
  $ if [ $SAMTOOLS_VERSION -ge 10 ]; then SAMTOOLS_NOPG='--no-PG'; fi

  $ "$PBMM2" align -j 1 "$IN" "$REF" "${CRAMTMP}"/demultiplex.bc1009--bc1009.bam --log-level FATAL
  $ "$SAMTOOLS" view ${SAMTOOLS_NOPG} "${CRAMTMP}"/demultiplex.bc1009--bc1009.bam > "${CRAMTMP}"/demuxed.sam
  $ wc -l < "${CRAMTMP}"/demuxed.sam | tr -d ' '
  1

Verify that TLEN matches ref length in absence of soft-clipping.

  $ cut -f 6 "${CRAMTMP}"/demuxed.sam | grep -c '3057='
  1
  $ cut -f 9 "${CRAMTMP}"/demuxed.sam | grep -c '3057'
  1
