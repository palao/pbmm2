test(
  'pbmm2 formatting check',
  pbmm2_clang_formatter,
  args : [
    '--all'],
  workdir : meson.project_source_root())

subdir('unit')

pbmm2_cram_test = [
  'baminput_1',
  'baminput_2',
  'baminput_3',
  'baminput_4',
  'baminput_5',
  'baminput_6',
  'baminput_7',
  'baminput_8',
  'baminput_9',
  'baminput_10',
  'baminput_11',
  'baminput_12',
  'baminput_13',
  'baminput_14',
  'baminput_15',
  'baminput_16',
  'baminput_17',
  'baminput_18',
  'baminput_19',
  'baminput_20',
  'baminput_21',
  'baminput_22',
  'baminput_23',
  'baminput_24',
  'baminput_25',
  'baminput_26',
  'baminput_27',
  'baminput_28',
  'baminput_29',
  'baminput_30',
  'biosampleConsensus_1',
  'biosampleConsensus_2',
  'biosampleConsensus_3',
  'biosampleConsensus_4',
  'biosampleConsensus_5',
  'biosampleConsensus_6',
  'biosampleConsensus_7',
  'biosampleConsensus_8',
  'biosampleConsensus_9',
  'biosampleConsensus_10',
  'biosampleSubreads_1',
  'biosampleSubreads_2',
  'biosampleSubreads_3',
  'biosampleSubreads_4',
  'biosampleSubreads_5',
  'biosampleSubreads_6',
  'biosampleSubreads_7',
  'demuxed',
  'empty_1',
  'empty_2',
  'enforcedMapping',
  'fastxinput_1',
  'fastxinput_2',
  'fastxinput_3',
  'fastxinput_4',
  'fastxinput_5',
  'fastxinput_6',
  'fastxinput_7',
  'fastxinput_8',
  'fastxinput_9',
  'fastxinput_10',
  'fastxinput_11',
  'fastxinput_12',
  'fastxinput_13',
  'fastxinput_14',
  'fastxinput_15',
  'fastxinput_16',
  'fastxinput_17',
  'fastxinput_18',
  'fastxinput_19',
  'fastxinput_20',
  'fastxinput_21',
  'fastxinput_22',
  'fastxinput_23',
  'fastxinput_24',
  'fsa_ref',
  'idempotence_1',
  'idempotence_2',
  'idempotence_3',
  'jsoninput',
  'misc_1',
  'misc_2',
  'misc_3',
  'misc_4',
  'misc_5',
  'misc_6',
  'misc_7',
  'misc_8',
  'misc_9',
  'misc_10',
  'nohpc',
  'overlap',
  'readgroup',
  'refxml',
  'sa_1',
  'sa_2',
  'splitsample',
  'splitsamplejson',
  'splitsamplejsonsorted',
  'splitsamplesamename',
  'splitsamplesorted',
  'strip',
  'unaligned',
  'unrolled',
  ]

pbmm2_test_minimap2 = find_program('minimap2', required : false)
if not pbmm2_test_minimap2.found()
  message('Using minimap2 from subproject')

  if pbmm2_minimap2_dep.type_name() == 'internal'
    pbmm2_test_minimap2 = pbmm2_minimap2_subproject.get_variable('mm2_main')
  else
    error('Could not find minimap2 executable, which is required for tests')
  endif
endif

pbmm2_test_samtools = find_program('samtools')

foreach t : pbmm2_cram_test
  test(
    'pbmm2 cram test - ' + t,
    pbmm2_cram_script,
    args : [
      '--xunit-file=' + join_paths(meson.project_build_root(), 'pbmm2-cram-' + t.underscorify() + '-test.xml'),
      '--verbose'] + files('cram/' + t + '.t'),
    env : [
      'MINIMAP2=' + pbmm2_test_minimap2.full_path(),
      'PBMM2=' + pbmm2_main.full_path(),
      'TESTDIR=' + meson.current_source_dir(),
      'SAMTOOLS=' + pbmm2_test_samtools.full_path(),
    ],
    timeout : 36000) # with '-O0 -g' tests can be *very* slow
endforeach
