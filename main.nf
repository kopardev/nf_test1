

//Print out log
log.info """\
         R N A S E Q - N F   P I P E L I N E    
         ===================================
         reads        : ${params.reads}
         """
         .stripIndent()

//import modules

include {cutadapt} from './modules/cutadapt/cutadapt'
// include {fastqc} from './modules/qc/fastqc'
// include {star} from './modules/mapping/star'
// include {rsem} from './modules/quant/rsem'
// include {multiqc} from './modules/qc/multiqc'


workflow{
    read_pairs = Channel
        .fromFilePairs(params.reads, flat: true)
        .ifEmpty { exit 1, "Read pairs could not be found: ${params.reads}" }
    // genomeIndex = Channel.of(file(params.genome_index, checkIfExists:true))
    // gtf = Channel.of(file(params.gtf, checkIfExists:true))
    // genomeIndex = Channel.of(file(params.genome_index, checkIfExists:true))
    // rsemIndex = Channel.of(file(params.rsem_index, checkIfExists:true))
    cutadapt(read_pairs)
    // fastqc(cutadapt.out)
    // star(
    //     cutadapt.out
    //         .combine(genomeIndex)
    //         .combine(gtf)
    // )
    // rsem(
    //     star.out
    //         .combine(rsemIndex)
    // )
    // multiqc(fastqc.out)

}
