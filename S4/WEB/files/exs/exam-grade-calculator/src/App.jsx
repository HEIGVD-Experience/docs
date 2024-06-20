import { useState, useEffect } from 'react';

function App() {
  const [modules, setModules] = useState([]);
  const [unites, setUnites] = useState([]);
  const [moduleInput, setModuleInput] = useState('');
  const [uniteInput, setUniteInput] = useState('');
  const [selectedUnite, setSelectedUnite] = useState('');
  const [coefficient, setCoefficient] = useState('');
  const [theoryCoefficient, setTheoryCoefficient] = useState('');
  const [practicalCoefficient, setPracticalCoefficient] = useState('');
  const [examCoefficient, setExamCoefficient] = useState('');
  const [unitModuleAssignments, setUnitModuleAssignments] = useState({});
  const [notes, setNotes] = useState({});

  // Charger les données depuis localStorage au démarrage
  useEffect(() => {
    const savedData = localStorage.getItem('data');
    if (savedData) {
      const data = JSON.parse(savedData);
      setModules(data.modules || []);
      setUnites(data.unites || []);
      setUnitModuleAssignments(data.unitModuleAssignments || {});
      setNotes(data.notes || {});
    }
  }, []);

  useEffect(() => {
    const data = {
      modules,
      unites,
      unitModuleAssignments,
      notes,
    };
    localStorage.setItem('data', JSON.stringify(data));
  }, [modules, unites, unitModuleAssignments, notes]);

  const handleModuleChange = (e) => {
    setModuleInput(e.target.value);
  };

  const handleUniteChange = (e) => {
    setUniteInput(e.target.value);
  };

  const handleSelectedUniteChange = (e) => {
    setSelectedUnite(e.target.value);
  };

  const handleCoefficientChange = (e) => {
    setCoefficient(e.target.value);
  };

  const handleTheoryCoefChange = (e) => {
    setTheoryCoefficient(e.target.value);
  };

  const handlePracticalCoefChange = (e) => {
    setPracticalCoefficient(e.target.value);
  };

  const handleExamCoefChange = (e) => {
    setExamCoefficient(e.target.value);
  };

  const handleAddModule = () => {
    if (moduleInput.trim() && selectedUnite && coefficient.trim() && theoryCoefficient.trim() && practicalCoefficient.trim() && examCoefficient.trim()) {
      const newModule = {
        name: moduleInput.trim(),
        coefficient: parseFloat(coefficient),
        theoryCoefficient: parseFloat(theoryCoefficient),
        practicalCoefficient: parseFloat(practicalCoefficient),
        examCoefficient: parseFloat(examCoefficient)
      };
      setModules([...modules, newModule]);
      setUnitModuleAssignments({
        ...unitModuleAssignments,
        [selectedUnite]: [...(unitModuleAssignments[selectedUnite] || []), newModule]
      });
      setModuleInput('');
      setCoefficient('');
      setTheoryCoefficient('');
      setPracticalCoefficient('');
      setExamCoefficient('');
    }
  };

  const handleAddUnite = () => {
    if (uniteInput.trim()) {
      setUnites([...unites, uniteInput.trim()]);
      setUniteInput('');
    }
  };

  const handleAddNote = (moduleName, type, note) => {
    setNotes({
      ...notes,
      [moduleName]: {
        ...notes[moduleName],
        [type]: note,
      }
    });
  };

  const exportData = () => {
    const data = {
      modules,
      unites,
      unitModuleAssignments,
      notes,
    };
    const json = JSON.stringify(data, null, 2);
    const blob = new Blob([json], { type: 'application/json' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = 'data.json';
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a);
  };

  const importData = (event) => {
    const file = event.target.files[0];
    const reader = new FileReader();
    reader.onload = (e) => {
      const data = JSON.parse(e.target.result);
      setModules(data.modules || []);
      setUnites(data.unites || []);
      setUnitModuleAssignments(data.unitModuleAssignments || {});
      setNotes(data.notes || {});
    };
    reader.readAsText(file);
  };

  const calculateModuleAverageWithoutExam = (module) => {
    const { theoryCoefficient, practicalCoefficient } = module;
    let totalWeight = theoryCoefficient + practicalCoefficient;
    if (totalWeight === 0) return 0;

    let totalScore = 0;
    if (notes[module.name]?.theorie) {
      totalScore += parseFloat(notes[module.name]?.theorie) * (theoryCoefficient / totalWeight);
    }
    if (notes[module.name]?.pratique) {
      totalScore += parseFloat(notes[module.name]?.pratique) * (practicalCoefficient / totalWeight);
    }
    return totalScore.toFixed(2);
  }

  const calculateModuleAverage = (module) => {
    const { theoryCoefficient, practicalCoefficient, examCoefficient } = module;
    let totalWeight = theoryCoefficient + practicalCoefficient + examCoefficient;
    if (totalWeight === 0) return 0;

    let totalScore = 0;
    if (notes[module.name]?.theorie) {
      totalScore += parseFloat(notes[module.name]?.theorie) * (theoryCoefficient / totalWeight);
    }
    if (notes[module.name]?.pratique) {
      totalScore += parseFloat(notes[module.name]?.pratique) * (practicalCoefficient / totalWeight);
    }
    if (notes[module.name]?.examen) {
      totalScore += parseFloat(notes[module.name]?.examen) * (examCoefficient / totalWeight);
    }
    return totalScore.toFixed(2);
  };

  const calculateUnitAverage = (unitModules) => {
    let totalCoefficient = 0;
    let totalModuleScore = 0;

    unitModules.forEach(module => {
      totalCoefficient += module.coefficient;
      totalModuleScore += parseFloat(calculateModuleAverage(module)) * module.coefficient;
    });

    if (totalCoefficient === 0) return 0;

    return (totalModuleScore / totalCoefficient).toFixed(2);
  };

  return (
    <div className="min-h-screen bg-gray-100 flex flex-col items-center justify-center p-4">
      <div className="w-full max-w-2xl">
        <h1 className="text-3xl font-bold mb-4">Gestion des Modules et Unités</h1>
        <div className="flex mb-4 space-x-4">
          <div className="flex-1">
            <input
              type="text"
              value={uniteInput}
              onChange={handleUniteChange}
              className="border p-2 w-full mb-2"
              placeholder="Ajouter une unité"
            />
            <button
              onClick={handleAddUnite}
              className="bg-green-500 text-white p-2 w-full"
            >
              Ajouter Unité
            </button>
            <div className="mb-4 mt-3">
              <h2 className="text-xl font-semibold">Unités</h2>
              <ul className="list-disc pl-4">
                {unites.map((unite, index) => (
                  <li key={index}>{unite}</li>
                ))}
              </ul>
            </div>
          </div>
          <div className="flex-1">
            <input
              type="text"
              value={moduleInput}
              onChange={handleModuleChange}
              className="border p-2 w-full mb-2"
              placeholder="Ajouter un module"
            />
            <select
              value={selectedUnite}
              onChange={handleSelectedUniteChange}
              className="border p-2 w-full mb-2"
            >
              <option value="">Sélectionner une unité</option>
              {unites.map((unite, index) => (
                <option key={index} value={unite}>{unite}</option>
              ))}
            </select>
            <input
              type="number"
              value={coefficient}
              onChange={handleCoefficientChange}
              className="border p-2 w-full mb-2"
              placeholder="Unit coefficient"
            />
            <input
              type="number"
              value={theoryCoefficient}
              onChange={handleTheoryCoefChange}
              className="border p-2 w-full mb-2"
              placeholder="Theory coefficient"
            />
            <input
              type="number"
              value={practicalCoefficient}
              onChange={handlePracticalCoefChange}
              className="border p-2 w-full mb-2"
              placeholder="Practical coefficient"
            />
            <input
              type="number"
              value={examCoefficient}
              onChange={handleExamCoefChange}
              className="border p-2 w-full mb-2"
              placeholder="Exam coefficient"
            />
            <button
              onClick={handleAddModule}
              className="bg-blue-500 text-white p-2 w-full"
            >
              Ajouter Module
            </button>
          </div>
        </div>
        <div className="flex mb-4 space-x-4">
          <button onClick={exportData} className="bg-yellow-500 text-white p-2 w-full">
            Exporter les données
          </button>
          <input
            type="file"
            onChange={importData}
            className="border p-2 w-full"
          />
        </div>
      </div>
      <div className="w-full max-w-2xl">
        <h1 className="text-2xl font-bold mb-4">Assignation unité-module</h1>
        {Object.entries(unitModuleAssignments).map(([unite, modules], index) => (
          <div key={index} className="mb-4">
            <h2 className="text-xl font-semibold">{unite} - Moyenne {calculateUnitAverage(modules)}</h2>
            <ul className="list-disc pl-4">
              {modules.map((module, index) => (
                <li key={index}>
                  {module.name} (Coefficient: {module.coefficient}) - Moyenne sans examens {calculateModuleAverageWithoutExam(module)} - Moyenne: {calculateModuleAverage(module)}
                  <div className="mt-2">
                    <input
                      type="text"
                      placeholder="Moyenne théorie"
                      value={notes[module.name]?.theorie || ''}
                      onChange={(e) => handleAddNote(module.name, 'theorie', e.target.value)}
                      className="border p-2 mr-2"
                    />
                    <input
                      type="text"
                      placeholder="Moyenne pratique"
                      value={notes[module.name]?.pratique || ''}
                      onChange={(e) => handleAddNote(module.name, 'pratique', e.target.value)}
                      className="border p-2 mr-2"
                    />
                    <input
                      type="text"
                      placeholder="Moyenne examen"
                      value={notes[module.name]?.examen || ''}
                      onChange={(e) => handleAddNote(module.name, 'examen', e.target.value)}
                      className="border p-2"
                    />
                  </div>
                </li>
              ))}
            </ul>
          </div>
        ))}
      </div>
    </div>
  );
}

export default App;
