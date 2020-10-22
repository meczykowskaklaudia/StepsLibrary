package pl.meczykowska.stepslibrary.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import pl.meczykowska.stepslibrary.domain.Step;

import java.util.List;

@Repository
public interface IStepRepository extends CrudRepository<Step, Integer> {
    Step save(Step step);

    Step findById(int id);

    List<Step> findAll();

    void deleteById(int id);
}
