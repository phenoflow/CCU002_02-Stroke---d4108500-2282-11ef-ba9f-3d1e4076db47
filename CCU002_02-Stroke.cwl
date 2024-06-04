cwlVersion: v1.0
steps:
  read-potential-cases-disc:
    run: read-potential-cases-disc.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
      potentialCases:
        id: potentialCases
        source: potentialCases
  ccu002_02-stroke-haemorrhage---secondary:
    run: ccu002_02-stroke-haemorrhage---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-disc/output
  ccu002_02-stroke-brain---secondary:
    run: ccu002_02-stroke-brain---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: ccu002_02-stroke-haemorrhage---secondary/output
  subcortical-ccu002_02-stroke---secondary:
    run: subcortical-ccu002_02-stroke---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: ccu002_02-stroke-brain---secondary/output
  ccu002_02-stroke-capsule---secondary:
    run: ccu002_02-stroke-capsule---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: subcortical-ccu002_02-stroke---secondary/output
  ccu002_02-stroke-infarct---secondary:
    run: ccu002_02-stroke-infarct---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: ccu002_02-stroke-capsule---secondary/output
  intracerebral-ccu002_02-stroke---secondary:
    run: intracerebral-ccu002_02-stroke---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: ccu002_02-stroke-infarct---secondary/output
  ischemic-ccu002_02-stroke---secondary:
    run: ischemic-ccu002_02-stroke---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: intracerebral-ccu002_02-stroke---secondary/output
  ccu002_02-stroke-lacunar---secondary:
    run: ccu002_02-stroke-lacunar---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: ischemic-ccu002_02-stroke---secondary/output
  ccu002_02-stroke---secondary:
    run: ccu002_02-stroke---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: ccu002_02-stroke-lacunar---secondary/output
  cerebellar-ccu002_02-stroke---secondary:
    run: cerebellar-ccu002_02-stroke---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: ccu002_02-stroke---secondary/output
  ccu002_02-stroke-millardgubler---secondary:
    run: ccu002_02-stroke-millardgubler---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: cerebellar-ccu002_02-stroke---secondary/output
  carotid-ccu002_02-stroke---secondary:
    run: carotid-ccu002_02-stroke---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: ccu002_02-stroke-millardgubler---secondary/output
  vertebrobasilar-ccu002_02-stroke---secondary:
    run: vertebrobasilar-ccu002_02-stroke---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: carotid-ccu002_02-stroke---secondary/output
  ccu002_02-stroke-foville---secondary:
    run: ccu002_02-stroke-foville---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule15
      potentialCases:
        id: potentialCases
        source: vertebrobasilar-ccu002_02-stroke---secondary/output
  ccu002_02-stroke-webergubler---secondary:
    run: ccu002_02-stroke-webergubler---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule16
      potentialCases:
        id: potentialCases
        source: ccu002_02-stroke-foville---secondary/output
  bilateral-ccu002_02-stroke---secondary:
    run: bilateral-ccu002_02-stroke---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule17
      potentialCases:
        id: potentialCases
        source: ccu002_02-stroke-webergubler---secondary/output
  ccu002_02-stroke-claude's---secondary:
    run: ccu002_02-stroke-claude's---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule18
      potentialCases:
        id: potentialCases
        source: bilateral-ccu002_02-stroke---secondary/output
  other-ccu002_02-stroke---secondary:
    run: other-ccu002_02-stroke---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule19
      potentialCases:
        id: potentialCases
        source: ccu002_02-stroke-claude's---secondary/output
  ccu002_02-stroke-pathology---secondary:
    run: ccu002_02-stroke-pathology---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule20
      potentialCases:
        id: potentialCases
        source: other-ccu002_02-stroke---secondary/output
  ccu002_02-stroke-sided---secondary:
    run: ccu002_02-stroke-sided---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule21
      potentialCases:
        id: potentialCases
        source: ccu002_02-stroke-pathology---secondary/output
  cerebrovascular-ccu002_02-stroke---secondary:
    run: cerebrovascular-ccu002_02-stroke---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule22
      potentialCases:
        id: potentialCases
        source: ccu002_02-stroke-sided---secondary/output
  ccu002_02-stroke-tia---secondary:
    run: ccu002_02-stroke-tia---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule23
      potentialCases:
        id: potentialCases
        source: cerebrovascular-ccu002_02-stroke---secondary/output
  ccu002_02-stroke-artery---secondary:
    run: ccu002_02-stroke-artery---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule24
      potentialCases:
        id: potentialCases
        source: ccu002_02-stroke-tia---secondary/output
  transient-ccu002_02-stroke---secondary:
    run: transient-ccu002_02-stroke---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule25
      potentialCases:
        id: potentialCases
        source: ccu002_02-stroke-artery---secondary/output
  ccu002_02-stroke-resulting---secondary:
    run: ccu002_02-stroke-resulting---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule26
      potentialCases:
        id: potentialCases
        source: transient-ccu002_02-stroke---secondary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule27
      potentialCases:
        id: potentialCases
        source: ccu002_02-stroke-resulting---secondary/output
class: Workflow
inputs:
  potentialCases:
    id: potentialCases
    doc: Input of potential cases for processing
    type: File
  inputModule1:
    id: inputModule1
    doc: Python implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
  inputModule15:
    id: inputModule15
    doc: Python implementation unit
    type: File
  inputModule16:
    id: inputModule16
    doc: Python implementation unit
    type: File
  inputModule17:
    id: inputModule17
    doc: Python implementation unit
    type: File
  inputModule18:
    id: inputModule18
    doc: Python implementation unit
    type: File
  inputModule19:
    id: inputModule19
    doc: Python implementation unit
    type: File
  inputModule20:
    id: inputModule20
    doc: Python implementation unit
    type: File
  inputModule21:
    id: inputModule21
    doc: Python implementation unit
    type: File
  inputModule22:
    id: inputModule22
    doc: Python implementation unit
    type: File
  inputModule23:
    id: inputModule23
    doc: Python implementation unit
    type: File
  inputModule24:
    id: inputModule24
    doc: Python implementation unit
    type: File
  inputModule25:
    id: inputModule25
    doc: Python implementation unit
    type: File
  inputModule26:
    id: inputModule26
    doc: Python implementation unit
    type: File
  inputModule27:
    id: inputModule27
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
