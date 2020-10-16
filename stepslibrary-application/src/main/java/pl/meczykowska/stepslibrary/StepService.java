package pl.meczykowska.stepslibrary;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.meczykowska.stepslibrary.domain.Step;

import java.util.List;

@Service
public class StepService {

    @Autowired
    IStepRepository repository;

    public void addStep(Step step) {
        repository.save(step);
    }

    public Step findStepById(int index){
        return repository.findById(index);
    }

    public List<Step> findAllSteps(){
        return repository.findAll();
    }
}
